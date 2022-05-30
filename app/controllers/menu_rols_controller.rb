class MenuRolsController < HomeController
  before_action :set_menu_rol, only: %i[ show edit update destroy ]

  # GET /menu_rols or /menu_rols.json
  def index
    @menu_rols = MenuRol.all

    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Mostar el boton crear verde, se le debe poner como argumento 2
    @menu_principal = "menu_rols"
    @permisos_crud = get_crud_permisos(@menu_principal, 2)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia seguridad
    @menu_show = MenuRol.all
    @ruta_local = "/menu_rols"
    @direccion = direccionador(@ruta_local,@menu_show)   
    @direccion
    #Finaliza seguridad
  end

  # GET /menu_rols/1 or /menu_rols/1.json
  def show
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Inicia mostrar o no boton editar y eliminar
    @menu_principal = "menu_rols" #En realidad es de la ruta por eso va plural
    @permisos_crud = get_crud_permisos(@menu_principal, 1)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia Seguridad 
    @menu_detalle = @menu_rol #Singular
    @ruta_local = "/menu_rols/:id" #plural
    @direccion = direccionador(@ruta_local,@menu_detalle)   
    @direccion
    #Termina Seguridad    
  end

  # GET /menu_rols/new
  def new
    @menu_rol = MenuRol.new

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu = MenuRol.new #Singular y el primero en mayuscula
    @ruta_local = "/menu_rols/new" #plural
    @direccion = direccionador(@ruta_local,@menu)   
    @direccion
    #Finaliza Segurid    
  end

  # GET /menu_rols/1/edit
  def edit
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu_edit = edit_menu_rol_path #singular
    @ruta_local = "/menu_rols/:id/edit"
    @direccion = direccionador(@ruta_local,@menu_edit)   
    @direccion
    #Finaliza Segur
  end

  # POST /menu_rols or /menu_rols.json
  def create
    @menu_rol = MenuRol.new(menu_rol_params)

    respond_to do |format|
      if @menu_rol.save
        format.html { redirect_to menu_rol_url(@menu_rol), notice: "Menu rol was successfully created." }
        format.json { render :show, status: :created, location: @menu_rol }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu_rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_rols/1 or /menu_rols/1.json
  def update
    respond_to do |format|
      if @menu_rol.update(menu_rol_params)
        format.html { redirect_to menu_rol_url(@menu_rol), notice: "Menu rol was successfully updated." }
        format.json { render :show, status: :ok, location: @menu_rol }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menu_rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_rols/1 or /menu_rols/1.json
  def destroy
   #definimos la ruta para eliminar
   @ruta_local = "/menu_rols/:id"
   @url_delete = @menu_rol #Singular
   @url_path = menu_rols_url #Plural
   #metodo para determinar si tiene permisos de eliminar 
   direccionador_destroy(@ruta_local, @url_delete, @url_path, "Menu-Rol ") #ultimo argumento es para mensaje de exito
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_rol
      @menu_rol = MenuRol.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def menu_rol_params
      params.require(:menu_rol).permit(:menu_id, :rol_id)
    end
end
