class EmpleadosController < HomeController
  before_action :set_empleado, only: %i[ show edit update destroy ]

  # GET /empleados or /empleados.json
  def index
    @empleados = Empleado.all

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Mostar el boton crear verde, se le debe poner como argumento 2
    @menu_principal = "empleados"
    @permisos_crud = get_crud_permisos(@menu_principal, 2)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia seguridad
    @menu_show = Empleado.all
    @ruta_local = "/empleados"
    @direccion = direccionador(@ruta_local,@menu_show)   
    @direccion
    #Finaliza seguridad
  end

  # GET /empleados/1 or /empleados/1.json
  def show
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Inicia mostrar o no boton editar y eliminar
    @menu_principal = "/empleados/" #En realidad es de la ruta por eso va plural
    @permisos_crud = get_crud_permisos(@menu_principal, 1)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia Seguridad 
    @menu_detalle = @empleado #Singular
    @ruta_local = "/empleados/:id" #plural
    @direccion = direccionador(@ruta_local,@menu_detalle)   
    @direccion
    #Termina Seguridad    
  end

  # GET /empleados/new
  def new
    @empleado = Empleado.new

    # #ASIDE
    # @menu_rol_nav = menus_y_submenus_usuario(1)

    # #Iniciar Seguridad
    # @menu = Empleado.new #Singular y el primero en mayuscula
    # @ruta_local = "/empleados/new" #plural
    # @direccion = direccionador(@ruta_local,@menu)   
    # @direccion
    # #Finaliza Seguridad    
  end

  # GET /empleados/1/edit
  def edit
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu_edit = edit_empleado_path #singular
    @ruta_local = "/empleados/:id/edit"
    @direccion = direccionador(@ruta_local,@menu_edit)   
    @direccion
    #Finaliza Seguridad    
  end

  # POST /empleados or /empleados.json
  def create
    @empleado = Empleado.new(empleado_params)

    respond_to do |format|
      if @empleado.save
        format.html { redirect_to empleado_url(@empleado), notice: "Empleado was successfully created." }
        format.json { render :show, status: :created, location: @empleado }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empleado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empleados/1 or /empleados/1.json
  def update
    respond_to do |format|
      if @empleado.update(empleado_params)
        format.html { redirect_to empleado_url(@empleado), notice: "Empleado was successfully updated." }
        format.json { render :show, status: :ok, location: @empleado }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empleado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empleados/1 or /empleados/1.json
  def destroy
    #definimos la ruta para eliminar
    @ruta_local = "/empleados/:id"
    @url_delete = @empleado #Singular
    @url_path = empleados_url #Plural
    #metodo para determinar si tiene permisos de eliminar 
    direccionador_destroy(@ruta_local, @url_delete, @url_path, "Empleado ") #ultimo argumento es para mensaje de exito    
   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empleado
      @empleado = Empleado.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empleado_params
      params.require(:empleado).permit(:nombre_empleado, :apellido_empleado, :profesion, :dui_empleado, :municipio_id, :user_id)
    end
end
