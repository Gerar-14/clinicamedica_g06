class RolEmpleadosController < HomeController
  before_action :set_rol_empleado, only: %i[ show edit update destroy ]

  # GET /rol_empleados or /rol_empleados.json
  def index
    @rol_empleados = RolEmpleado.all

    #ASIDE
    @menu_rol = menus_y_submenus_usuario(1)

    #Mostar el boton crear verde, se le debe poner como argumento 2
    @menu_principal = "rol_empleados"
    @permisos_crud = get_crud_permisos(@menu_principal, 2)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia seguridad
    @menu_show = RolEmpleado.all
    @ruta_local = "/rol_empleados"
    @direccion = direccionador(@ruta_local,@menu_show)   
    @direccion
    #Finaliza seguridad

  end

  # GET /rol_empleados/1 or /rol_empleados/1.json
  def show
    #ASIDE
    @menu_rol = menus_y_submenus_usuario(1)

    #Inicia mostrar o no boton editar y eliminar
    @menu_principal = "rol_empleados" #En realidad es de la ruta por eso va plural
    @permisos_crud = get_crud_permisos(@menu_principal, 1)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia Seguridad 
    @menu_detalle = @rolEmpleado #Singular
    @ruta_local = "/rol_empleados/:id" #plural
    @direccion = direccionador(@ruta_local,@menu_detalle)   
    @direccion
    #Termina Seguridad    
  end

  # GET /rol_empleados/new
  def new
    @rol_empleado = RolEmpleado.new

    #ASIDE
    @menu_rol = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu = RolEmpleado.new #Singular y el primero en mayuscula
    @ruta_local = "/rol_empleados/new" #plural
    @direccion = direccionador(@ruta_local,@menu)   
    @direccion
    #Finaliza Seguridad    
  end

  # GET /rol_empleados/1/edit
  def edit
    #ASIDE
    @menu_rol = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu_edit = edit_rol_empleado_path #singular
    @ruta_local = "/rol_empleados/:id/edit"
    @direccion = direccionador(@ruta_local,@menu_edit)   
    @direccion
    #Finaliza Seguridad
  end

  # POST /rol_empleados or /rol_empleados.json
  def create
    @rol_empleado = RolEmpleado.new(rol_empleado_params)

    respond_to do |format|
      if @rol_empleado.save
        format.html { redirect_to rol_empleado_url(@rol_empleado), notice: "Rol empleado was successfully created." }
        format.json { render :show, status: :created, location: @rol_empleado }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rol_empleado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rol_empleados/1 or /rol_empleados/1.json
  def update
    respond_to do |format|
      if @rol_empleado.update(rol_empleado_params)
        format.html { redirect_to rol_empleado_url(@rol_empleado), notice: "Rol empleado was successfully updated." }
        format.json { render :show, status: :ok, location: @rol_empleado }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rol_empleado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rol_empleados/1 or /rol_empleados/1.json
  def destroy
   #definimos la ruta para eliminar
   @ruta_local = "/rol_empleados/:id"
   @url_delete = @rol_empleado #Singular
   @url_path = rol_empleados_url #Plural
   #metodo para determinar si tiene permisos de eliminar 
   direccionador_destroy(@ruta_local, @url_delete, @url_path, "Rol del empleado ") #ultimo argumento es para mensaje de exito
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rol_empleado
      @rol_empleado = RolEmpleado.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rol_empleado_params
      params.require(:rol_empleado).permit(:rol_id, :empleado_id)
    end
end
