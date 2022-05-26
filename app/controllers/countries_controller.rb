class CountriesController < HomeController
  before_action :set_country, only: %i[ show edit update destroy ]

  # GET /countries or /countries.json
  def index
    @countries = Country.all

    #ASIDE
    @menu_rol = menus_y_submenus_usuario(1)

    #Inicia mostrar o no boton editar y eliminar, se le pasa como argumento 2 para que devuelva un bool
    @menu_principal = "countries"
    @permisos_crud = get_crud_permisos(@menu_principal, 2)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia seguridad
    @menu_show = Country.all
    @ruta_local = "/countries"
    @direccion = direccionador(@ruta_local,@menu_show)   
    @direccion
    #Finaliza seguridad
  end

  # GET /countries/1 or /countries/1.json
  def show
    #ASIDE
    @menu_rol = menus_y_submenus_usuario(1)

    #Inicia mostrar o no boton editar y eliminar, se le pasa como argumento 1 para que devuelva array
    @menu_principal = "countries"
    @permisos_crud = get_crud_permisos(@menu_principal, 1)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia Seguridad 
    @menu_detalle = @country
    @ruta_local = "/countries/:id"
    @direccion = direccionador(@ruta_local,@menu_detalle)   
    @direccion
    #Termina Seguridad
  end

  # GET /countries/new
  def new
    #ASIDE
    @menu_rol = menus_y_submenus_usuario(1)
    
    #Iniciar Seguridad
    @country = Country.new
    @ruta_local = "/countries/new"
    @direccion = direccionador(@ruta_local,@menu)   
    @direccion
    #Finaliza Seguridad
  end

  # GET /countries/1/edit
  def edit
    #ASIDE
    @menu_rol = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu_edit = edit_country_path	
    @ruta_local = "/countries/:id/edit"
    @direccion = direccionador(@ruta_local,@menu_edit)   
    @direccion
    #Finaliza Seguridad
  end

  # POST /countries or /countries.json
  def create
    @country = Country.new(country_params)

    respond_to do |format|
      if @country.save
        format.html { redirect_to country_url(@country), notice: "País creado exitosamente." }
        format.json { render :show, status: :created, location: @country }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /countries/1 or /countries/1.json
  def update
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to country_url(@country), notice: "País editado exitosamente." }
        format.json { render :show, status: :ok, location: @country }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /countries/1 or /countries/1.json
  def destroy

   #definimos la ruta para eliminar
   @ruta_local = "/countries/:id"
   @url_delete = @country #Singular
   @url_path = countries_url #Plural
   #metodo para determinar si tiene permisos de eliminar 
   direccionador_destroy(@ruta_local, @url_delete, @url_path, "País")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def country_params
      params.require(:country).permit(:nombre_country)
    end
end
