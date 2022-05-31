class TypeExamParametrosController < HomeController
  before_action :set_type_exam_parametro, only: %i[ show edit update destroy ]

  # GET /type_exam_parametros or /type_exam_parametros.json
  def index
    @type_exam_parametros = TypeExamParametro.all

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)
    # Pegar en la vista <%= render template: "home/nav" %>

    #mostrara el boton crar verde, poner como argumento 2
    @menu_principal = "type_exam_parametros"
    @permisos_crud = get_crud_permisos(@menu_principal, 2)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia seguridad
    @menu_show = TypeExamParametro.all
    @ruta_local = "/type_exam_parametros"
    @direccion = direccionador(@ruta_local,@menu_show)   
    @direccion
    #Finaliza seguridad
  end

  # GET /type_exam_parametros/1 or /type_exam_parametros/1.json
  def show

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)
    
    #Inicia mostrar o no boton editar y eliminar
    @menu_principal = "type_exam_parametros"
    @permisos_crud = get_crud_permisos(@menu_principal, 1)
    #finaliza mostrar o no boton editar y eliminar
    
    #Inicia Seguridad 
    @menu_detalle = @type_exam_parametro #@menu es como el modelo pero en singular
    @ruta_local = "/type_exam_parametros/:id"
    @direccion = direccionador(@ruta_local,@menu_detalle)   
    @direccion
    #Termina Seguridad

  end

  # GET /type_exam_parametros/new
  def new
    @type_exam_parametro = TypeExamParametro.new

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu = TypeExamParametro.new
    @ruta_local = "/type_exam_parametros/new"
    @direccion = direccionador(@ruta_local,@menu)   
    @direccion
    #Finaliza Seguridad
  end

  # GET /type_exam_parametros/1/edit
  def edit

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu_edit = edit_type_exam_parametro_path
    @ruta_local = "/type_exam_parametros/:id/edit"
    @direccion = direccionador(@ruta_local,@menu_edit)   
    @direccion
    #Finaliza Seguridad

  end

  # POST /type_exam_parametros or /type_exam_parametros.json
  def create
    @type_exam_parametro = TypeExamParametro.new(type_exam_parametro_params)

    respond_to do |format|
      if @type_exam_parametro.save
        format.html { redirect_to type_exam_parametro_url(@type_exam_parametro), notice: "Type exam parametro was successfully created." }
        format.json { render :show, status: :created, location: @type_exam_parametro }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @type_exam_parametro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_exam_parametros/1 or /type_exam_parametros/1.json
  def update
    respond_to do |format|
      if @type_exam_parametro.update(type_exam_parametro_params)
        format.html { redirect_to type_exam_parametro_url(@type_exam_parametro), notice: "Type exam parametro was successfully updated." }
        format.json { render :show, status: :ok, location: @type_exam_parametro }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @type_exam_parametro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_exam_parametros/1 or /type_exam_parametros/1.json
  def destroy
    #definimos la ruta para eliminar
   @ruta_local = "/type_exam_parametros/:id"
   @url_delete = @type_exam_parametro #Singular
   @url_path = type_exam_parametros_url #Plural
   #metodo para determinar si tiene permisos de eliminar 
   direccionador_destroy(@ruta_local, @url_delete, @url_path, "Tipo Examen Parametro")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_exam_parametro
      @type_exam_parametro = TypeExamParametro.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def type_exam_parametro_params
      params.require(:type_exam_parametro).permit(:parametro_id, :type_exam_id)
    end
end
