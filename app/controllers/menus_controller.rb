class MenusController < HomeController
  before_action :set_menu, only: %i[ show edit update destroy ]

  # GET /menus or /menus.json
  def index
    @menus = Menu.all
    #@accesos = verificarAcceso()

    @menu_rol = menus_y_submenus_usuario(1)
    @menu_show = Menu.all
    @ruta_local = "/menus"
    
    @direccion = direccionador(@ruta_local,@menu_show)   

    @direccion
  end

  # GET /menus/1 or /menus/1.json
  def show
    
    
    @menu_detalle = @menu
    @ruta_local = "/menus/:id"
    @ruta_eliminar = ""


    @permisos_crud = get_crud_permisos(@ruta_local)
    puts @permisos_crud
    
    @direccion = direccionador(@ruta_local,@menu_detalle)   

    @direccion

  end

  # GET /menus/new
  def new
    
    @menu_rol = menus_y_submenus_usuario(1)
    @menu = Menu.new
    @ruta_local = "/menus/new"
    
    @direccion = direccionador(@ruta_local,@menu)   

    @direccion
    
  end

  # GET /menus/1/edit
  def edit

    @menu_edit = edit_menu_path
    @ruta_local = "/menus/:id/edit"
    
    @direccion = direccionador(@ruta_local,@menu_edit)   

    @direccion

  end

  # POST /menus or /menus.json
  def create
    @menu = Menu.new(menu_params)
    
    respond_to do |format|
      if @menu.save
        format.html { redirect_to menu_url(@menu), notice: "Menu was successfully created." }
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
        format.html { redirect_to menu_url(@menu), notice: "Menu was successfully updated." }
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
   #metodo para determinar si tiene permisos de eliminar 
   direccionador_destroy(@ruta_local)
   
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
