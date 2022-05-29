class PermisosController < HomeController
  before_action :set_permiso, only: %i[ show edit update destroy ]

  # GET /permisos or /permisos.json
  def index
    @permisos = Permiso.all

    #ASIDE
    @menu_rol = menus_y_submenus_usuario(1)

    #Mostar el boton crear verde, se le debe poner como argumento 2
    @menu_principal = "permisos"
    @permisos_crud = get_crud_permisos(@menu_principal, 2)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia seguridad
    @menu_show = Permiso.all
    @ruta_local = "/permisos"
    @direccion = direccionador(@ruta_local,@menu_show)   
    @direccion
    #Finaliza seguridad        
  end

  # GET /permisos/1 or /permisos/1.json
  def show
    #ASIDE
    @menu_rol = menus_y_submenus_usuario(1)

    #Inicia mostrar o no boton editar y eliminar
    @menu_principal = "permisos" #En realidad es de la ruta por eso va plural
    @permisos_crud = get_crud_permisos(@menu_principal, 1)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia Seguridad 
    @menu_detalle = @permiso #Singular
    @ruta_local = "/permisos/:id" #plural
    @direccion = direccionador(@ruta_local,@menu_detalle)   
    @direccion
    #Termina Seguridad
  end

  # GET /permisos/new
  def new
    @permiso = Permiso.new
    
    #ASIDE
    @menu_rol = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu = Permiso.new #Singular y el primero en mayuscula
    @ruta_local = "/permisos/new" #plural
    @direccion = direccionador(@ruta_local,@menu)   
    @direccion
    #Finaliza Seguridad
  end

  # GET /permisos/1/edit
  def edit
    #ASIDE
    @menu_rol = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu_edit = edit_permiso_path #singular
    @ruta_local = "/permisos/:id/edit"
    @direccion = direccionador(@ruta_local,@menu_edit)   
    @direccion
    #Finaliza Seguridad
  end

  # POST /permisos or /permisos.json
  def create
    @permiso = Permiso.new(permiso_params)

    respond_to do |format|
      if @permiso.save
        format.html { redirect_to permiso_url(@permiso), notice: "Permiso was successfully created." }
        format.json { render :show, status: :created, location: @permiso }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @permiso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permisos/1 or /permisos/1.json
  def update
    respond_to do |format|
      if @permiso.update(permiso_params)
        format.html { redirect_to permiso_url(@permiso), notice: "Permiso was successfully updated." }
        format.json { render :show, status: :ok, location: @permiso }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @permiso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permisos/1 or /permisos/1.json
  def destroy
   #definimos la ruta para eliminar
   @ruta_local = "/permisos/:id"
   @url_delete = @permiso #Singular
   @url_path = permisos_url #Plural
   #metodo para determinar si tiene permisos de eliminar 
   direccionador_destroy(@ruta_local, @url_delete, @url_path, "Permiso ") #ultimo argumento es para mensaje de exito
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permiso
      @permiso = Permiso.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def permiso_params
      params.require(:permiso).permit(:nombre_permiso, :ruta, :crud)
    end
end
