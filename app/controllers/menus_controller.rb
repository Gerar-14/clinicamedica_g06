class MenusController < HomeController
  before_action :set_menu, only: %i[ show edit update destroy ]

  # GET /menus or /menus.json
  def index
    @menus = Menu.all
    #@accesos = verificarAcceso()

    #ASIDE
    @menu_rol = menus_y_submenus_usuario(1)
    # Pegar en la vista <%= render template: "home/nav" %>

    #mostrara el boton crar verde, poner como argumento 2
    @menu_principal = "menus"
    @permisos_crud = get_crud_permisos(@menu_principal, 2)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia seguridad
    @menu_show = Menu.all
    @ruta_local = "/menus"
    @direccion = direccionador(@ruta_local,@menu_show)   
    @direccion
    #Finaliza seguridad
  end

  # GET /menus/1 or /menus/1.json
  def show

    #ASIDE
    @menu_rol = menus_y_submenus_usuario(1)
    
    #Inicia mostrar o no boton editar y eliminar
    @menu_principal = "menus"
    @permisos_crud = get_crud_permisos(@menu_principal, 1)
    #finaliza mostrar o no boton editar y eliminar
    
    #Inicia Seguridad 
    @menu_detalle = @menu #@menu es como el modelo pero en singular
    @ruta_local = "/menus/:id"
    @direccion = direccionador(@ruta_local,@menu_detalle)   
    @direccion
    #Termina Seguridad

  end

  # GET /menus/new
  def new
    #ASIDE
    @menu_rol = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu = Menu.new
    @ruta_local = "/menus/new"
    @direccion = direccionador(@ruta_local,@menu)   
    @direccion
    #Finaliza Seguridad
    
  end

  # GET /menus/1/edit
  def edit

    #ASIDE
    @menu_rol = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu_edit = edit_menu_path
    @ruta_local = "/menus/:id/edit"
    @direccion = direccionador(@ruta_local,@menu_edit)   
    @direccion
    #Finaliza Seguridad
  end

  # POST /menus or /menus.json
  def create
    @menu = Menu.new(menu_params)
    
    respond_to do |format|
      if @menu.save
        format.html { redirect_to menu_url(@menu), notice: "Menú creado exitosamente." }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /menus/1 or /menus/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to menu_url(@menu), notice: "Menu editado exitosamente." }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1 or /menus/1.json
  def destroy
   #definimos la ruta para eliminar
   @ruta_local = "/menus/:id"
   @url_delete = @menu #Singular
   @url_path = menus_url #Plural
   #metodo para determinar si tiene permisos de eliminar 
   direccionador_destroy(@ruta_local, @url_delete, @url_path, "Menú")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def menu_params
      params.require(:menu).permit(:nombre, :menu_id)
    end
end
