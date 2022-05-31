class MuestrasController < HomeController
  before_action :set_muestra, only: %i[ show edit update destroy ]

  # GET /muestras or /muestras.json
  def index
    @muestras = Muestra.all

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)
    # Pegar en la vista <%= render template: "home/nav" %>

    #mostrara el boton crar verde, poner como argumento 2
    @menu_principal = "muestras"
    @permisos_crud = get_crud_permisos(@menu_principal, 2)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia seguridad
    @menu_show = Muestra.all
    @ruta_local = "/muestras"
    @direccion = direccionador(@ruta_local,@menu_show)   
    @direccion
    #Finaliza seguridad
  end

  # GET /muestras/1 or /muestras/1.json
  def show

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)
    
    #Inicia mostrar o no boton editar y eliminar
    @menu_principal = "muestras"
    @permisos_crud = get_crud_permisos(@menu_principal, 1)
    #finaliza mostrar o no boton editar y eliminar
    
    #Inicia Seguridad 
    @menu_detalle = @muestra #@menu es como el modelo pero en singular
    @ruta_local = "/muestras/:id"
    @direccion = direccionador(@ruta_local,@menu_detalle)   
    @direccion
    #Termina Seguridad
  end

  # GET /muestras/new
  def new

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu = Muestra.new
    @ruta_local = "/muestras/new"
    @direccion = direccionador(@ruta_local,@menu)   
    @direccion
    #Finaliza Seguridad

    @muestra = Muestra.new
    @muestra_fecha_actual = Time.now.strftime("%Y-%m-%dT%k:%M")
  #  Para mostrar la tabla con las muestras para el paciente
    @id_orden = Orden.select(:id).last(1).to_s.tr('[#<Orden id:]>', '')
    @muestras_by_orden = muestras_by_orden_id(@id_orden)

    @usuario = current_user.id
    @recibio = Empleado.find_by_sql(["select id, nombre_empleado from empleados where user_id = ?", current_user.id])
  end

  # GET /muestras/1/edit
  def edit

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu_edit = edit_muestra_path
    @ruta_local = "/muestras/:id/edit"
    @direccion = direccionador(@ruta_local,@menu_edit)   
    @direccion
    #Finaliza Seguridad

  end

  # Funcion que devuelve las muestras de examenes mediante el id de la orden
  def muestras_by_orden_id(idOrden)
    @muestras_by_orden = Muestra.find_by_sql(["select id, tipo_muestra from muestras where orden_id in (select
        id from ordens where id = ?)", idOrden])
    # @ordenes_tipo_examen_creadas = OrdenTypeExam.find_by_sql(["select id from orden_type_exams where orden_id = ?", idOrden])
  end

  def eliminar_muestra(idOrdenMuestra)
    @orden_muestra = Muestra.find_by_sql(["delete from muestras where id in (select id from muestras where orden_id = ?)", idOrdenMuestra])
  end

  def eliminar_ordenes_y_examenes_de_ordenes(idOrdenTipoExamen)
    @orden_examen = OrdenTypeExam.find_by_sql(["delete from orden_type_exams where id in (select id from orden_type_exams where orden_id = ?)", idOrdenTipoExamen])
  end

  def eliminar_orden(idOrden)
    @orden = Orden.find_by_sql(["delete from ordens where id = ?", idOrden])
  end

  # POST /muestras or /muestras.json
  def create
    @muestra = Muestra.new(muestra_params)

    respond_to do |format|
      if @muestra.save && params[:add_muestra]
        format.html { redirect_to new_muestra_path, notice: "Muestra was successfully created." }
        format.json { render :show, status: :created, location: @muestra }
      # elsif params[:finish_muestra]
      #   format.html { redirect_to muestra_url(@muestra), notice: "Muestra con la misma orden finalizada." }
      #   format.json { render :show, status: :created, location: @muestra }
      # elsif params[:delete_muestra]
      #   #@id = OrdenTypeExam.find_by_sql(["SELECT orden_id FROM orden_type_exams ORDER BY orden_id DESC LIMIT 1"])
      #   #@id = OrdenTypeExam.select(:orden_id).last(1).to_s.tr('[#<OrdenTypeExam id: nil, orden_id:]>', '')
      #   @id = Muestra.select(:orden_id).last(1).to_s.tr('[#<Muestra id: nil, orden_id:]>', '')
      #   #puts "impresion " + @id.to_s.tr('[#<OrdenTypeExam id: nil, orden_id:]>', '')
      #   eliminar_muestra(@id)
      #   eliminar_ordenes_y_examenes_de_ordenes(@id)
      #   eliminar_orden(@id)

      #   format.html { redirect_to new_orden_path, notice: "Proceso eliminado" }
      #   format.json { head :no_content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @muestra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /muestras/1 or /muestras/1.json
  def update
    respond_to do |format|
      if @muestra.update(muestra_params)
        format.html { redirect_to muestra_url(@muestra), notice: "Muestra was successfully updated." }
        format.json { render :show, status: :ok, location: @muestra }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @muestra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /muestras/1 or /muestras/1.json
  def destroy
    #definimos la ruta para eliminar
   @ruta_local = "/muestras/:id"
   @url_delete = @muestra #Singular
   @url_path = muestra_url #Plural
   #metodo para determinar si tiene permisos de eliminar 
   direccionador_destroy(@ruta_local, @url_delete, @url_path, "Muestra")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_muestra
      @muestra = Muestra.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def muestra_params
      params.require(:muestra).permit(:tipo_muestra, :fecha_entrega_muestra, :empleado_id, :orden_id)
    end
end
