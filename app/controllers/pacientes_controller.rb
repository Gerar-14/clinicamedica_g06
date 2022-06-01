class PacientesController < HomeController
  before_action :set_paciente, only: %i[ show edit update destroy ]

  # GET /pacientes or /pacientes.json
  def index
    @pacientes = Paciente.all

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Mostar el boton crear verde, se le debe poner como argumento 2
    @menu_principal = "pacientes"
    @permisos_crud = get_crud_permisos(@menu_principal, 2)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia seguridad
    @menu_show = Paciente.all
    @ruta_local = "/pacientes"
    @direccion = direccionador(@ruta_local,@menu_show)   
    @direccion
    #Finaliza seguridad    
  end

  # GET /pacientes/1 or /pacientes/1.json
  def show
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Inicia mostrar o no boton editar y eliminar
    @menu_principal = "pacientes" #En realidad es de la ruta por eso va plural
    @permisos_crud = get_crud_permisos(@menu_principal, 1)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia Seguridad 
    @menu_detalle = @paciente #Singular
    @ruta_local = "/pacientes/:id" #plural
    @direccion = direccionador(@ruta_local,@menu_detalle)   
    @direccion
    #Termina Seguridad 
    
    #Expediente clinico del paciente
    @pacien = Paciente.find(params[:id])
    @examenes_paciente = Orden.find_by_sql(["SELECT *, orden_type_exams.estado as estado_type_exam from ordens INNER join orden_type_exams on (ordens.id=orden_type_exams.orden_id) INNER JOIN type_exams on (type_exams.id = orden_type_exams.type_exam_id) where paciente_id = ?",@paciente])
  end

  # GET /pacientes/new
  def new
    @paciente = Paciente.new

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu = Paciente.new #Singular y el primero en mayuscula
    @ruta_local = "/pacientes/new" #plural
    @direccion = direccionador(@ruta_local,@menu)   
    @direccion
    #Finaliza Seguridad    
  end

  # GET /pacientes/1/edit
  def edit
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu_edit = edit_paciente_path #singular
    @ruta_local = "/pacientes/:id/edit"
    @direccion = direccionador(@ruta_local,@menu_edit)   
    @direccion
    #Finaliza Seguridad    
  end

  # POST /pacientes or /pacientes.json
  def create
    @paciente = Paciente.new(paciente_params)

    respond_to do |format|
      if @paciente.save
        format.html { redirect_to paciente_url(@paciente), notice: "Paciente was successfully created." }
        format.json { render :show, status: :created, location: @paciente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pacientes/1 or /pacientes/1.json
  def update
    respond_to do |format|
      if @paciente.update(paciente_params)
        format.html { redirect_to paciente_url(@paciente), notice: "Paciente was successfully updated." }
        format.json { render :show, status: :ok, location: @paciente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pacientes/1 or /pacientes/1.json
  def destroy
   #definimos la ruta para eliminar
   @ruta_local = "/pacientes/:id"
   @url_delete = @paciente #Singular
   @url_path = pacientes_url #Plural
   #metodo para determinar si tiene permisos de eliminar 
   direccionador_destroy(@ruta_local, @url_delete, @url_path, "Paciente ") #ultimo argumento es para mensaje de exito
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paciente
      @paciente = Paciente.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def paciente_params
      params.require(:paciente).permit(:nombre_paciente, :apellido_paciente, :genero_paciente, :fecha_nacimiento, :direccion, :telefono, :telefono_celular, :telefono_contacto, :correo_electronico, :apellido_casado, :estado_civil, :dui_paciente, :pasaporte, :municipio_id, :tipo_sangre_id)
    end
end
