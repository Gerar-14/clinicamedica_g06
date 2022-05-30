class LaboratoriosController < HomeController
  before_action :set_laboratorio, only: %i[ show edit update destroy ]

  # GET /laboratorios or /laboratorios.json
  def index
    @laboratorios = Laboratorio.all

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Mostar el boton crear verde, se le debe poner como argumento 2
    @menu_principal = "laboratorios"
    @permisos_crud = get_crud_permisos(@menu_principal, 2)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia seguridad
    @menu_show = Laboratorio.all
    @ruta_local = "/laboratorios"
    @direccion = direccionador(@ruta_local,@menu_show)   
    @direccion
    #Finaliza seguridad    
  end

  # GET /laboratorios/1 or /laboratorios/1.json
  def show
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Inicia mostrar o no boton editar y eliminar
    @menu_principal = "laboratorios" #En realidad es de la ruta por eso va plural
    @permisos_crud = get_crud_permisos(@menu_principal, 1)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia Seguridad 
    @menu_detalle = @laboratorio #Singular
    @ruta_local = "/laboratorios/:id" #plural
    @direccion = direccionador(@ruta_local,@menu_detalle)   
    @direccion
    #Termina Seguridad    
  end

  # GET /laboratorios/new
  def new
    @laboratorio = Laboratorio.new

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu = Laboratorio.new #Singular y el primero en mayuscula
    @ruta_local = "/laboratorios/new" #plural
    @direccion = direccionador(@ruta_local,@menu)   
    @direccion
    #Finaliza Seguridad    
  end

  # GET /laboratorios/1/edit
  def edit
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu_edit = edit_laboratorio_path #singular
    @ruta_local = "/laboratorios/:id/edit"
    @direccion = direccionador(@ruta_local,@menu_edit)   
    @direccion
    #Finaliza Seguridad    
  end

  # POST /laboratorios or /laboratorios.json
  def create
    @laboratorio = Laboratorio.new(laboratorio_params)

    respond_to do |format|
      if @laboratorio.save
        format.html { redirect_to laboratorio_url(@laboratorio), notice: "Laboratorio was successfully created." }
        format.json { render :show, status: :created, location: @laboratorio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @laboratorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laboratorios/1 or /laboratorios/1.json
  def update
    respond_to do |format|
      if @laboratorio.update(laboratorio_params)
        format.html { redirect_to laboratorio_url(@laboratorio), notice: "Laboratorio was successfully updated." }
        format.json { render :show, status: :ok, location: @laboratorio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @laboratorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laboratorios/1 or /laboratorios/1.json
  def destroy
       #definimos la ruta para eliminar
   @ruta_local = "/laboratorios/:id"
   @url_delete = @laboratorio #Singular
   @url_path = laboratorios_url #Plural
   #metodo para determinar si tiene permisos de eliminar 
   direccionador_destroy(@ruta_local, @url_delete, @url_path, "Laboratorio ") #ultimo argumento es para mensaje de exito
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laboratorio
      @laboratorio = Laboratorio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def laboratorio_params
      params.require(:laboratorio).permit(:nombre_laboratorio, :municipio_id)
    end
end
