class AccesosController < HomeController
  before_action :set_acceso, only: %i[ show edit update destroy ]

  # GET /accesos or /accesos.json
  def index
    @accesos = Acceso.all

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Mostar el boton crear verde, se le debe poner como argumento 2
    @menu_principal = "accesos"
    @permisos_crud = get_crud_permisos(@menu_principal, 2)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia seguridad
    @menu_show = Acceso.all
    @ruta_local = "/accesos"
    @direccion = direccionador(@ruta_local,@menu_show)   
    @direccion
    #Finaliza seguridad    
  end

  # GET /accesos/1 or /accesos/1.json
  def show
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Inicia mostrar o no boton editar y eliminar
    @menu_principal = "accesos" #En realidad es de la ruta por eso va plural
    @permisos_crud = get_crud_permisos(@menu_principal, 1)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia Seguridad 
    @menu_detalle = @acceso #Singular
    @ruta_local = "/accesos/:id" #plural
    @direccion = direccionador(@ruta_local,@menu_detalle)   
    @direccion
    #Termina Seguridad    
  end

  # GET /accesos/new
  def new
    @acceso = Acceso.new

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu = Acceso.new #Singular y el primero en mayuscula
    @ruta_local = "/accesos/new" #plural
    @direccion = direccionador(@ruta_local,@menu)   
    @direccion
    #Finaliza Seguridad
  end

  # GET /accesos/1/edit
  def edit
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu_edit = edit_acceso_path #singular
    @ruta_local = "/accesos/:id/edit"
    @direccion = direccionador(@ruta_local,@menu_edit)   
    @direccion
    #Finaliza Seguridad    
  end

  # POST /accesos or /accesos.json
  def create
    @acceso = Acceso.new(acceso_params)

    respond_to do |format|
      if @acceso.save
        format.html { redirect_to acceso_url(@acceso), notice: "Acceso was successfully created." }
        format.json { render :show, status: :created, location: @acceso }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @acceso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accesos/1 or /accesos/1.json
  def update
    respond_to do |format|
      if @acceso.update(acceso_params)
        format.html { redirect_to acceso_url(@acceso), notice: "Acceso was successfully updated." }
        format.json { render :show, status: :ok, location: @acceso }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @acceso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accesos/1 or /accesos/1.json
  def destroy
   #definimos la ruta para eliminar
   @ruta_local = "/accesos/:id"
   @url_delete = @acceso #Singular
   @url_path = accesos_url #Plural
   #metodo para determinar si tiene permisos de eliminar 
   direccionador_destroy(@ruta_local, @url_delete, @url_path, "Acceso ") #ultimo argumento es para mensaje de exito
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acceso
      @acceso = Acceso.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def acceso_params
      params.require(:acceso).permit(:rol_id, :permiso_id)
    end
end
