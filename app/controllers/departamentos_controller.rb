class DepartamentosController < HomeController
  before_action :set_departamento, only: %i[ show edit update destroy ]

  # GET /departamentos or /departamentos.json
  def index
    @departamentos = Departamento.all

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Mostar el boton crear verde, se le debe poner como argumento 2
    @menu_principal = "departamentos"
    @permisos_crud = get_crud_permisos(@menu_principal, 2)
    puts "estoy desde el controlador index"
    puts @permisos_crud
    #finaliza mostrar o no boton editar y eliminar

    #Inicia seguridad
    @menu_show =  Departamento.all
    @ruta_local = "/departamentos"
    @direccion = direccionador(@ruta_local,@menu_show)   
    @direccion
    #Finaliza seguridad
  end

  # GET /departamentos/1 or /departamentos/1.json
  def show
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Inicia mostrar o no boton editar y eliminar
    @menu_principal = "departamentos"
    @permisos_crud = get_crud_permisos(@menu_principal, 1)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia Seguridad 
    @menu_detalle = @menu #@menu es como el modelo pero en singular
    @ruta_local = "/departamentos/:id"
    @direccion = direccionador(@ruta_local,@menu_detalle)   
    @direccion
    #Termina Seguridad
  end

  # GET /departamentos/new
  def new
    @departamento = Departamento.new

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu = Departamento.new
    @ruta_local = "/departamentos/new"
    @direccion = direccionador(@ruta_local,@menu)   
    @direccion
    #Finaliza Seguridad
  end

  # GET /departamentos/1/edit
  def edit
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu_edit = edit_departamento_path
    @ruta_local = "/departamentos/:id/edit"
    @direccion = direccionador(@ruta_local,@menu_edit)   
    @direccion
    #Finaliza Seguridad
  end

  # POST /departamentos or /departamentos.json
  def create
    @departamento = Departamento.new(departamento_params)

    respond_to do |format|
      if @departamento.save
        format.html { redirect_to departamento_url(@departamento), notice: "Departamento creado exitosamente." }
        format.json { render :show, status: :created, location: @departamento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departamentos/1 or /departamentos/1.json
  def update
    respond_to do |format|
      if @departamento.update(departamento_params)
        format.html { redirect_to departamento_url(@departamento), notice: "Departamento edito exitosamente." }
        format.json { render :show, status: :ok, location: @departamento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departamentos/1 or /departamentos/1.json
  def destroy
   #definimos la ruta para eliminar
   @ruta_local = "/departamentos/:id"
   @url_delete = @departamento #Singular
   @url_path = departamentos_url #Plural
   #metodo para determinar si tiene permisos de eliminar 
   direccionador_destroy(@ruta_local, @url_delete, @url_path, "Departamento") #ultimo argumento es para mensaje de exito

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_departamento
      @departamento = Departamento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def departamento_params
      params.require(:departamento).permit(:nombre_departamento, :country_id)
    end
end