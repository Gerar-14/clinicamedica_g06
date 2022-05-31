class UnidadMedidasController < HomeController
  before_action :set_unidad_medida, only: %i[ show edit update destroy ]

  # GET /unidad_medidas or /unidad_medidas.json
  def index
    @unidad_medidas = UnidadMedida.all

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Mostar el boton crear verde, se le debe poner como argumento 2
    @menu_principal = "unidad_medidas"
    @permisos_crud = get_crud_permisos(@menu_principal, 2)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia seguridad
    @menu_show = UnidadMedida.all
    @ruta_local = "/unidad_medidas"
    @direccion = direccionador(@ruta_local,@menu_show)   
    @direccion
    #Finaliza seguridad    
  end

  # GET /unidad_medidas/1 or /unidad_medidas/1.json
  def show
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Inicia mostrar o no boton editar y eliminar
    @menu_principal = "unidad_medidas" #En realidad es de la ruta por eso va plural
    @permisos_crud = get_crud_permisos(@menu_principal, 1)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia Seguridad 
    @menu_detalle = @unidad_medida #Singular
    @ruta_local = "/unidad_medidas/:id" #plural
    @direccion = direccionador(@ruta_local,@menu_detalle)   
    @direccion
    #Termina Seguridad    
  end

  # GET /unidad_medidas/new
  def new
    @unidad_medida = UnidadMedida.new

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu = UnidadMedida.new #Singular y el primero en mayuscula
    @ruta_local = "/unidad_medidas/new" #plural
    @direccion = direccionador(@ruta_local,@menu)   
    @direccion
    #Finaliza Seguridad    
  end

  # GET /unidad_medidas/1/edit
  def edit
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu_edit = edit_unidad_medida_path #singular
    @ruta_local = "/unidad_medidas/:id/edit"
    @direccion = direccionador(@ruta_local,@menu_edit)   
    @direccion
    #Finaliza Seguridad    
  end

  # POST /unidad_medidas or /unidad_medidas.json
  def create
    @unidad_medida = UnidadMedida.new(unidad_medida_params)

    respond_to do |format|
      if @unidad_medida.save
        format.html { redirect_to unidad_medida_url(@unidad_medida), notice: "Unidad medida was successfully created." }
        format.json { render :show, status: :created, location: @unidad_medida }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @unidad_medida.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unidad_medidas/1 or /unidad_medidas/1.json
  def update
    respond_to do |format|
      if @unidad_medida.update(unidad_medida_params)
        format.html { redirect_to unidad_medida_url(@unidad_medida), notice: "Unidad medida was successfully updated." }
        format.json { render :show, status: :ok, location: @unidad_medida }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @unidad_medida.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unidad_medidas/1 or /unidad_medidas/1.json
  def destroy
   #definimos la ruta para eliminar
   @ruta_local = "/unidad_medidas/:id"
   @url_delete = @unidad_medida #Singular
   @url_path = unidad_medidas_url #Plural
   #metodo para determinar si tiene permisos de eliminar 
   direccionador_destroy(@ruta_local, @url_delete, @url_path, "UnidadMedida ") #ultimo argumento es para mensaje de exito
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unidad_medida
      @unidad_medida = UnidadMedida.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def unidad_medida_params
      params.require(:unidad_medida).permit(:nombre_unidad_medida, :siglas, :sistema_medida, :descripcion_unidad_medida)
    end
end
