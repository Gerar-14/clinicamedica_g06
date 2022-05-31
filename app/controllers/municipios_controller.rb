class MunicipiosController < HomeController
  before_action :set_municipio, only: %i[ show edit update destroy ]

  # GET /municipios or /municipios.json
  def index
    @municipios = Municipio.all
    
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Mostar el boton crear verde, se le debe poner como argumento 2
    @menu_principal = "municipios"
    @permisos_crud = get_crud_permisos(@menu_principal, 2)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia seguridad
    @menu_show = Municipio.all
    @ruta_local = "/municipios"
    @direccion = direccionador(@ruta_local,@menu_show)   
    @direccion
    #Finaliza seguridad
  end

  # GET /municipios/1 or /municipios/1.json
  def show
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Inicia mostrar o no boton editar y eliminar
    @menu_principal = "municipios" #En realidad es de la ruta por eso va plural
    @permisos_crud = get_crud_permisos(@menu_principal, 1)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia Seguridad 
    @menu_detalle = @municipio #Singular
    @ruta_local = "/municipios/:id" #plural
    @direccion = direccionador(@ruta_local,@menu_detalle)   
    @direccion
    #Termina Seguridad    
  end

  # GET /municipios/new
  def new
    @municipio = Municipio.new

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu = Municipio.new #Singular y el primero en mayuscula
    @ruta_local = "/municipios/new" #plural
    @direccion = direccionador(@ruta_local,@menu)   
    @direccion
    #Finaliza Seguridad    
  end

  # GET /municipios/1/edit
  def edit
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu_edit = edit_municipio_path #singular
    @ruta_local = "/municipios/:id/edit"
    @direccion = direccionador(@ruta_local,@menu_edit)   
    @direccion
    #Finaliza Seguridad    
  end

  # POST /municipios or /municipios.json
  def create
    @municipio = Municipio.new(municipio_params)

    respond_to do |format|
      if @municipio.save
        format.html { redirect_to municipio_url(@municipio), notice: "Municipio was successfully created." }
        format.json { render :show, status: :created, location: @municipio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @municipio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /municipios/1 or /municipios/1.json
  def update
    respond_to do |format|
      if @municipio.update(municipio_params)
        format.html { redirect_to municipio_url(@municipio), notice: "Municipio was successfully updated." }
        format.json { render :show, status: :ok, location: @municipio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @municipio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /municipios/1 or /municipios/1.json
  def destroy
       #definimos la ruta para eliminar
   @ruta_local = "/municipios/:id"
   @url_delete = @municipio #Singular
   @url_path = municipios_url #Plural
   #metodo para determinar si tiene permisos de eliminar 
   direccionador_destroy(@ruta_local, @url_delete, @url_path, "Municipio ") #ultimo argumento es para mensaje de exito
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_municipio
      @municipio = Municipio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def municipio_params
      params.require(:municipio).permit(:nombre_municipio, :departamento_id)
    end
end
