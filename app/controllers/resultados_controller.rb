class ResultadosController < HomeController
  before_action :set_resultado, only: %i[ show edit update destroy ]

  # GET /resultados or /resultados.json
  def index
    @resultados = Resultado.all

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Mostar el boton crear verde, se le debe poner como argumento 2
    @menu_principal = "resultados"
    @permisos_crud = get_crud_permisos(@menu_principal, 2)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia seguridad
    @menu_show = Resultado.all
    @ruta_local = "/resultados"
    @direccion = direccionador(@ruta_local,@menu_show)   
    @direccion
    #Finaliza seguridad    
  end

  # GET /resultados/1 or /resultados/1.json
  def show
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Inicia mostrar o no boton editar y eliminar
    @menu_principal = "resultados" #En realidad es de la ruta por eso va plural
    @permisos_crud = get_crud_permisos(@menu_principal, 1)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia Seguridad 
    @menu_detalle = @resultado #Singular
    @ruta_local = "/resultados/:id" #plural
    @direccion = direccionador(@ruta_local,@menu_detalle)   
    @direccion
    #Termina Seguridad    
  end

  # GET /resultados/new
  def new
    @resultado = Resultado.new

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu = Resultado.new #Singular y el primero en mayuscula
    @ruta_local = "/resultados/new" #plural
    @direccion = direccionador(@ruta_local,@menu)   
    @direccion
    #Finaliza Seguridad    
  end

  # GET /resultados/1/edit
  def edit
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu_edit = edit_resultado_path #singular
    @ruta_local = "/resultados/:id/edit"
    @direccion = direccionador(@ruta_local,@menu_edit)   
    @direccion
    #Finaliza Seguridad    
  end

  # POST /resultados or /resultados.json
  def create
    @resultado = Resultado.new(resultado_params)

    respond_to do |format|
      if @resultado.save
        format.html { redirect_to resultado_url(@resultado), notice: "Resultado was successfully created." }
        format.json { render :show, status: :created, location: @resultado }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resultado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resultados/1 or /resultados/1.json
  def update
    respond_to do |format|
      if @resultado.update(resultado_params)
        format.html { redirect_to resultado_url(@resultado), notice: "Resultado was successfully updated." }
        format.json { render :show, status: :ok, location: @resultado }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @resultado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resultados/1 or /resultados/1.json
  def destroy
   #definimos la ruta para eliminar
   @ruta_local = "/resultados/:id"
   @url_delete = @resultado #Singular
   @url_path = resultados_url #Plural
   #metodo para determinar si tiene permisos de eliminar 
   direccionador_destroy(@ruta_local, @url_delete, @url_path, "Resultado ") #ultimo argumento es para mensaje de exito    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resultado
      @resultado = Resultado.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def resultado_params
      params.require(:resultado).permit(:descripcion, :parametro_id, :orden_id)
    end
end
