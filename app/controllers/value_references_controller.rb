class ValueReferencesController < HomeController
  before_action :set_value_reference, only: %i[ show edit update destroy ]

  # GET /value_references or /value_references.json
  def index
    @value_references = ValueReference.all
  
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Mostar el boton crear verde, se le debe poner como argumento 2
    @menu_principal = "value_references"
    @permisos_crud = get_crud_permisos(@menu_principal, 2)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia seguridad
    @menu_show = ValueReference.all
    @ruta_local = "/value_references"
    @direccion = direccionador(@ruta_local,@menu_show)   
    @direccion
    #Finaliza seguridad
  end

  # GET /value_references/1 or /value_references/1.json
  def show
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Inicia mostrar o no boton editar y eliminar
    @menu_principal = "value_references" #En realidad es de la ruta por eso va plural
    @permisos_crud = get_crud_permisos(@menu_principal, 1)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia Seguridad 
    @menu_detalle = @value_reference #Singular
    @ruta_local = "/value_references/:id" #plural
    @direccion = direccionador(@ruta_local,@menu_detalle)   
    @direccion
    #Termina Seguridad    
  end

  # GET /value_references/new
  def new
    @value_reference = ValueReference.new

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu = ValueReference.new #Singular y el primero en mayuscula
    @ruta_local = "/value_references/new" #plural
    @direccion = direccionador(@ruta_local,@menu)   
    @direccion
    #Finaliza Seguridad    
  end

  # GET /value_references/1/edit
  def edit
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu_edit = edit_value_reference_path #singular
    @ruta_local = "/value_references/:id/edit"
    @direccion = direccionador(@ruta_local,@menu_edit)   
    @direccion
    #Finaliza Seguridad    
  end

  # POST /value_references or /value_references.json
  def create
    @value_reference = ValueReference.new(value_reference_params)

    respond_to do |format|
      if @value_reference.save
        format.html { redirect_to value_reference_url(@value_reference), notice: "Value reference was successfully created." }
        format.json { render :show, status: :created, location: @value_reference }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @value_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /value_references/1 or /value_references/1.json
  def update
    respond_to do |format|
      if @value_reference.update(value_reference_params)
        format.html { redirect_to value_reference_url(@value_reference), notice: "Value reference was successfully updated." }
        format.json { render :show, status: :ok, location: @value_reference }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @value_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /value_references/1 or /value_references/1.json
  def destroy
   #definimos la ruta para eliminar
   @ruta_local = "/value_references/:id"
   @url_delete = @value_reference #Singular
   @url_path = value_references_url #Plural
   #metodo para determinar si tiene permisos de eliminar 
   direccionador_destroy(@ruta_local, @url_delete, @url_path, "Valor de referencia ") #ultimo argumento es para mensaje de exito    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_value_reference
      @value_reference = ValueReference.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def value_reference_params
      params.require(:value_reference).permit(:value_reference, :parametro_id)
    end
end
