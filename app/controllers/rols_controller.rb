class RolsController < HomeController
  before_action :set_rol, only: %i[ show edit update destroy ]

  # GET /rols or /rols.json
  def index
    @rols = Rol.all
  
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Mostar el boton crear verde, se le debe poner como argumento 2
    @menu_principal = "rols"
    @permisos_crud = get_crud_permisos(@menu_principal, 2)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia seguridad
    @menu_show = Rol.all
    @ruta_local = "/rols"
    @direccion = direccionador(@ruta_local,@menu_show)   
    @direccion
    #Finaliza seguridad
  end

  # GET /rols/1 or /rols/1.json
  def show
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Inicia mostrar o no boton editar y eliminar
    @menu_principal = "/rols/" #En realidad es de la ruta por eso va plural
    @permisos_crud = get_crud_permisos(@menu_principal, 1)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia Seguridad 
    @menu_detalle = @rol #Singular
    @ruta_local = "/rols/:id" #plural
    @direccion = direccionador(@ruta_local,@menu_detalle)   
    @direccion
    #Termina Seguridad    
  end

  # GET /rols/new
  def new
    @rol = Rol.new

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu = Rol.new #Singular y el primero en mayuscula
    @ruta_local = "/rols/new" #plural
    @direccion = direccionador(@ruta_local,@menu)   
    @direccion
    #Finaliza Seguridad    
  end

  # GET /rols/1/edit
  def edit
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu_edit = edit_rol_path #singular
    @ruta_local = "/rols/:id/edit"
    @direccion = direccionador(@ruta_local,@menu_edit)   
    @direccion
    #Finaliza Seguridad    
  end

  # POST /rols or /rols.json
  def create
    @rol = Rol.new(rol_params)

    respond_to do |format|
      if @rol.save
        format.html { redirect_to rol_url(@rol), notice: "Rol was successfully created." }
        format.json { render :show, status: :created, location: @rol }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rols/1 or /rols/1.json
  def update
    respond_to do |format|
      if @rol.update(rol_params)
        format.html { redirect_to rol_url(@rol), notice: "Rol was successfully updated." }
        format.json { render :show, status: :ok, location: @rol }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rols/1 or /rols/1.json
  def destroy
   #definimos la ruta para eliminar
   @ruta_local = "/rols/:id"
   @url_delete = @rol #Singular
   @url_path = rols_url #Plural
   #metodo para determinar si tiene permisos de eliminar 
   direccionador_destroy(@ruta_local, @url_delete, @url_path, "Rol ") #ultimo argumento es para mensaje de exito

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rol
      @rol = Rol.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rol_params
      params.require(:rol).permit(:nombre_rol)
    end
end
