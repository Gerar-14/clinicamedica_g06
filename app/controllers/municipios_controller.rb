class MunicipiosController < HomeController
  before_action :set_municipio, only: %i[ show edit update destroy ]

  # GET /municipios or /municipios.json
  def index
    @municipios = Municipio.
    
    #ASIDE
    @menu_rol = menus_y_submenus_usuario(1)

    #Mostar el boton crear verde, se le debe poner como argumento 2
    @menu_principal = "municipios"
    @permisos_crud = get_crud_permisos(@menu_principal, 2)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia seguridad
    @menu_show = municipio.all
    @ruta_local = "/municipios"
    @direccion = direccionador(@ruta_local,@menu_show)   
    @direccion
    #Finaliza seguridad
  end

  # GET /municipios/1 or /municipios/1.json
  def show
  end

  # GET /municipios/new
  def new
    @municipio = Municipio.new
  end

  # GET /municipios/1/edit
  def edit
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
    @municipio.destroy

    respond_to do |format|
      format.html { redirect_to municipios_url, notice: "Municipio was successfully destroyed." }
      format.json { head :no_content }
    end
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
