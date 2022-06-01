class OrdensController < HomeController
  before_action :set_orden, only: %i[ show edit update destroy seleccionado finalizado]

  # GET /ordens or /ordens.json
  def index
    #Encontraremos el rol del usuario activo
    @usuario = current_user.id
    @empleado = obteniendo_empleado(@usuario)
    @id_rol = rol_empleado(@empleado.id)

    #id_rol = 3 es laboratorista
    #id_rol = 4 es jefe de laboratorista
    #id_rol = 2 recepcionista

    #@ordens = Orden.all
    @id_usuario_actual = current_user.id

    if @id_rol[0] == 3 #Laboratorista
      #Esta consulta SQL hace lo mismo que la linea 22
      #@ordens = Orden.find_by_sql(["SELECT ordens.id, ordens.fecha_examen, ordens.paciente_id, ordens.laboratory_worker_id FROM ordens INNER JOIN laboratory_workers on ordens.laboratory_worker_id = laboratory_workers.id INNER JOIN empleados on laboratory_workers.empleado_id = empleados.id INNER JOIN users on empleados.user_id = users.id WHERE empleados.profesion = 'Laboratorista' and empleados.user_id = ? ", @id_usuario_actual])
      #Esta consulta SQL es con los metodos de ActiveRecord que usa rails
      @ordens = Orden.select(:id,:fecha_examen,:paciente_id,:laboratory_worker_id, :estado)
      .joins(laboratory_worker: [empleado: :user])
      .where('empleados.profesion' => 'Laboratorista').where('empleados.user_id' => @id_usuario_actual)

    elsif @id_rol[0] == 2 #Recepcionista
      @ordens = get_orders_recepcionista()

    elsif @id_rol[0] == 4 #Jefe de laboratorio
      @ordens = Orden.all
    end

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Mostar el boton crear verde, se le debe poner como argumento 2
    @menu_principal = "ordens"
    @permisos_crud = get_crud_permisos(@menu_principal, 2)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia seguridad
    @menu_show = Orden.all
    @ruta_local = "/ordens"
    @direccion = direccionador(@ruta_local,@menu_show)   
    @direccion
    #Finaliza seguridad

  end

  def get_orders_recepcionista()
    @orders_jefes = Orden.find_by_sql(["SELECT * from ordens where estado = 1"])
    return @orders_jefes
  end

  # GET /ordens/1 or /ordens/1.json
  def show
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Inicia mostrar o no boton editar y eliminar
    @menu_principal = "/ordens/" #En realidad es de la ruta por eso va plural
    @permisos_crud = get_crud_permisos(@menu_principal, 1)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia Seguridad 
    @menu_detalle = @orden #Singular
    @ruta_local = "/ordens/:id" #plural
    @direccion = direccionador(@ruta_local,@menu_detalle)   
    @direccion
    #Termina Seguridad
  end

  # GET /ordens/new
  def new
    @orden = Orden.new
    @orden_fecha_actual = Time.now.strftime("%Y-%m-%dT%k:%M")
 
    #Llamar a los laboratoristas que tienen menos de 10 ordenes de examen pendientes
    @laboratoristas = Orden.find_by_sql("SELECT *, count(ordens.laboratory_worker_id) as conteo from ordens INNER JOIN laboratory_workers ON (ordens.laboratory_worker_id =laboratory_workers.id) INNER join empleados on (laboratory_workers.empleado_id = empleados.id) where estado = 1 GROUP by laboratory_worker_id HAVING conteo < 10;")

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu = Orden.new #Singular y el primero en mayuscula
    @ruta_local = "/ordens/new" #plural
    @direccion = direccionador(@ruta_local,@menu)   
    @direccion
    #Finaliza Seguridad

  end

  # GET /ordens/1/edit
  def edit
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu_edit = edit_orden_path #singular
    @ruta_local = "/ordens/:id/edit"
    @direccion = direccionador(@ruta_local,@menu_edit)   
    @direccion
    #Finaliza Seguridad 
    
    @laboratoristas = Orden.find_by_sql("SELECT *, count(ordens.laboratory_worker_id) as conteo from ordens INNER JOIN laboratory_workers ON (ordens.laboratory_worker_id =laboratory_workers.id) INNER join empleados on (laboratory_workers.empleado_id = empleados.id) where estado = 1 GROUP by laboratory_worker_id HAVING conteo < 10;")
  end

  # POST /ordens or /ordens.json
  def create
    @orden = Orden.new(orden_params)

    respond_to do |format|
      if @orden.save
        format.html { redirect_to new_orden_type_exam_path, notice: "Orden was successfully created." }
        format.json { render :show, status: :created, location: @orden }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @orden.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordens/1 or /ordens/1.json
  def update
    respond_to do |format|
      if @orden.update(orden_params)
        format.html { redirect_to orden_url(@orden), notice: "Orden was successfully updated." }
        format.json { render :show, status: :ok, location: @orden }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @orden.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordens/1 or /ordens/1.json
  def destroy 
   #definimos la ruta para eliminar
   @ruta_local = "/ordens/:id"
   @url_delete = @orden #Singular
   @url_path = ordens_url #Plural
   #metodo para determinar si tiene permisos de eliminar 
   direccionador_destroy(@ruta_local, @url_delete, @url_path, "Orden ") #ultimo argumento es para mensaje de exito    
  end

  def seleccionado
    @orden = Orden.find(params[:id])
    @orden_seleccionada = OrdenTypeExam.find_by_sql(["select * from orden_type_exams where orden_id = ?", @orden])
    # @orden_estado_actualizar = Orden.find_by_sql(["update ordens set ordens.estado = 0 where ordens.id = 
    #   (select DISTINCT orden_id from orden_type_exams where orden_id = ? and orden_type_exams.estado = 1)", @orden])
  end

  def finalizado
    @orden = Orden.find(params[:id])
    @orden_estado_actualizar = Orden.find_by_sql(["update ordens set ordens.estado = 0 where ordens.id in
      (select orden_id from orden_type_exams where orden_id = ? and orden_type_exams.estado = 1)", @orden])

      @id_usuario_actual = current_user.id
    #Esta consulta SQL hace lo mismo que la linea 11
    #@ordens = Orden.find_by_sql(["SELECT ordens.id, ordens.fecha_examen, ordens.paciente_id, ordens.laboratory_worker_id FROM ordens INNER JOIN laboratory_workers on ordens.laboratory_worker_id = laboratory_workers.id INNER JOIN empleados on laboratory_workers.empleado_id = empleados.id INNER JOIN users on empleados.user_id = users.id WHERE empleados.profesion = 'Laboratorista' and empleados.user_id = ? ", @id_usuario_actual])
    #Esta consulta SQL es con los metodos de ActiveRecord que usa rails
    @ordens = Orden.select(:id,:fecha_examen,:paciente_id,:laboratory_worker_id, :estado)
    .joins(laboratory_worker: [empleado: :user])
    .where('empleados.profesion' => 'Laboratorista').where('empleados.user_id' => @id_usuario_actual)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden
      @orden = Orden.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def orden_params
      params.require(:orden).permit(:fecha_examen, :paciente_id, :laboratory_worker_id)
    end
end
