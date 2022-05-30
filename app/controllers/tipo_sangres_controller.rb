class TipoSangresController < HomeController
  before_action :set_tipo_sangre, only: %i[ show edit update destroy ]

  # GET /tipo_sangres or /tipo_sangres.json
  def index
    @tipo_sangres = TipoSangre.all

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)
    puts("Este es el aside")
    puts @menu_rol_nav

    #Mostar el boton crear verde, se le debe poner como argumento 2
    @menu_principal = "tipo_sangres"
    @permisos_crud = get_crud_permisos(@menu_principal, 2)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia seguridad
    @menu_show = TipoSangre.all
    @ruta_local = "/tipo_sangres"
    @direccion = direccionador(@ruta_local,@menu_show)   
    @direccion
    #Finaliza seguridad
  end

  # GET /tipo_sangres/1 or /tipo_sangres/1.json
  def show
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Inicia mostrar o no boton editar y eliminar
    @menu_principal = "tipo_sangres" #En realidad es de la ruta por eso va plural
    @permisos_crud = get_crud_permisos(@menu_principal, 1)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia Seguridad 
    @menu_detalle = @tipoSangre #Singular
    @ruta_local = "/tipo_sangres/:id" #plural
    @direccion = direccionador(@ruta_local,@menu_detalle)   
    @direccion
    #Termina Seguridad
  end

  # GET /tipo_sangres/new
  def new
    @tipo_sangre = TipoSangre.new

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu = TipoSangre.new #Singular y el primero en mayuscula
    @ruta_local = "/tipo_sangres/new" #plural
    @direccion = direccionador(@ruta_local,@menu)   
    @direccion
    #Finaliza Seguridad
  end

  # GET /tipo_sangres/1/edit
  def edit
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu_edit = edit_tipo_sangre_path #singular
    @ruta_local = "/tipo_sangres/:id/edit"
    @direccion = direccionador(@ruta_local,@menu_edit)   
    @direccion
    #Finaliza Seguridad
  end

  # POST /tipo_sangres or /tipo_sangres.json
  def create
    @tipo_sangre = TipoSangre.new(tipo_sangre_params)

    respond_to do |format|
      if @tipo_sangre.save
        format.html { redirect_to tipo_sangre_url(@tipo_sangre), notice: "Tipo sangre was successfully created." }
        format.json { render :show, status: :created, location: @tipo_sangre }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tipo_sangre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_sangres/1 or /tipo_sangres/1.json
  def update
    respond_to do |format|
      if @tipo_sangre.update(tipo_sangre_params)
        format.html { redirect_to tipo_sangre_url(@tipo_sangre), notice: "Tipo sangre was successfully updated." }
        format.json { render :show, status: :ok, location: @tipo_sangre }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tipo_sangre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_sangres/1 or /tipo_sangres/1.json
  def destroy
   #definimos la ruta para eliminar
   @ruta_local = "/tipo_sangres/:id"
   @url_delete = @tipo_sangre #Singular
   @url_path = tipo_sangres_url #Plural
   #metodo para determinar si tiene permisos de eliminar 
   direccionador_destroy(@ruta_local, @url_delete, @url_path, "Tipo de sangre ") #ultimo argumento es para mensaje de exito
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_sangre
      @tipo_sangre = TipoSangre.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_sangre_params
      params.require(:tipo_sangre).permit(:nombre_tipo_sangre)
    end


end
