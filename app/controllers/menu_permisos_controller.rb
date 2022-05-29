class MenuPermisosController < ApplicationController
  before_action :set_menu_permiso, only: %i[ show edit update destroy ]

  # GET /menu_permisos or /menu_permisos.json
  def index
    @menu_permisos = MenuPermiso.all
  end

  # GET /menu_permisos/1 or /menu_permisos/1.json
  def show
  end

  # GET /menu_permisos/new
  def new
    @menu_permiso = MenuPermiso.new
  end

  # GET /menu_permisos/1/edit
  def edit
  end

  # POST /menu_permisos or /menu_permisos.json
  def create
    @menu_permiso = MenuPermiso.new(menu_permiso_params)

    respond_to do |format|
      if @menu_permiso.save
        format.html { redirect_to menu_permiso_url(@menu_permiso), notice: "Menu permiso was successfully created." }
        format.json { render :show, status: :created, location: @menu_permiso }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu_permiso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_permisos/1 or /menu_permisos/1.json
  def update
    respond_to do |format|
      if @menu_permiso.update(menu_permiso_params)
        format.html { redirect_to menu_permiso_url(@menu_permiso), notice: "Menu permiso was successfully updated." }
        format.json { render :show, status: :ok, location: @menu_permiso }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menu_permiso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_permisos/1 or /menu_permisos/1.json
  def destroy
    @menu_permiso.destroy

    respond_to do |format|
      format.html { redirect_to menu_permisos_url, notice: "Menu permiso was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_permiso
      @menu_permiso = MenuPermiso.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def menu_permiso_params
      params.require(:menu_permiso).permit(:menu_id, :permiso_id)
    end
end

# class MenuPermisosController < HomeController
#   before_action :set_menu_permiso, only: %i[ show edit update destroy ]

#   # GET /menu_permisos or /menu_permisos.json
#   def index
#     @menu_permisos = MenuPermiso.all

#     #ASIDE
#     @menu_rol = menus_y_submenus_usuario(1)

#     #Mostar el boton crear verde, se le debe poner como argumento 2
#     @menu_principal = "menu_permisos"
#     @permisos_crud = get_crud_permisos(@menu_principal, 2)
#     #finaliza mostrar o no boton editar y eliminar

#     #Inicia seguridad
#     @menu_show = MenuPermiso.all
#     @ruta_local = "/menu_permisos"
#     @direccion = direccionador(@ruta_local,@menu_show)   
#     @direccion
#     #Finaliza seguridad
#   end

#   # GET /menu_permisos/1 or /menu_permisos/1.json
#   def show
#     #ASIDE
#     @menu_rol = menus_y_submenus_usuario(1)

#     #Inicia mostrar o no boton editar y eliminar
#     @menu_principal = "menu_permisos" #En realidad es de la ruta por eso va plural
#     @permisos_crud = get_crud_permisos(@menu_principal, 1)
#     #finaliza mostrar o no boton editar y eliminar

#     #Inicia Seguridad 
#     @menu_detalle = @menuPermiso #Singular_es_la_direcion
#     @ruta_local = "/menu_permisos/:id" #plural
#     @direccion = direccionador(@ruta_local,@menu_detalle)   
#     @direccion
#     #Termina Seguridad    
#   end

#   # GET /menu_permisos/new
#   def new
#     @menu_permiso = MenuPermiso.new

#     #ASIDE
#     @menu_rol = menus_y_submenus_usuario(1)

#     #Iniciar Seguridad
#     @menu = MenuPermiso.new #Singular y el primero en mayuscula
#     @ruta_local = "/menu_permisos/new" #plural
#     @direccion = direccionador(@ruta_local,@menu)   
#     @direccion
#     #Finaliza Seguridad    
#   end

#   # GET /menu_permisos/1/edit
#   def edit
#     #ASIDE
#     @menu_rol = menus_y_submenus_usuario(1)

#     #Iniciar Seguridad
#     @menu_edit = edit_menu_permiso_path #singular
#     @ruta_local = "/menu_permisos/:id/edit"
#     @direccion = direccionador(@ruta_local,@menu_edit)   
#     @direccion
#     #Finaliza Seguridad    
#   end

#   # POST /menu_permisos or /menu_permisos.json
#   def create
#     @menu_permiso = MenuPermiso.new(menu_permiso_params)

#     respond_to do |format|
#       if @menu_permiso.save
#         format.html { redirect_to menu_permiso_url(@menu_permiso), notice: "Menu permiso was successfully created." }
#         format.json { render :show, status: :created, location: @menu_permiso }
#       else
#         format.html { render :new, status: :unprocessable_entity }
#         format.json { render json: @menu_permiso.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /menu_permisos/1 or /menu_permisos/1.json
#   def update
#     respond_to do |format|
#       if @menu_permiso.update(menu_permiso_params)
#         format.html { redirect_to menu_permiso_url(@menu_permiso), notice: "Menu permiso was successfully updated." }
#         format.json { render :show, status: :ok, location: @menu_permiso }
#       else
#         format.html { render :edit, status: :unprocessable_entity }
#         format.json { render json: @menu_permiso.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /menu_permisos/1 or /menu_permisos/1.json
#   def destroy
#    #definimos la ruta para eliminar
#    @ruta_local = "/menu_permisos/:id"
#    @url_delete = @menu_permiso #Singular
#    @url_path = menu_permisos_url #Plural
#    #metodo para determinar si tiene permisos de eliminar 
#    direccionador_destroy(@ruta_local, @url_delete, @url_path, "Menu-Permiso ") #ultimo argumento es para mensaje de exito
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_menu_permiso
#       @menu_permiso = MenuPermiso.find(params[:id])
#     end

#     # Only allow a list of trusted parameters through.
#     def menu_permiso_params
#       params.require(:menu_permiso).permit(:menu_id, :permiso_id)
#     end
# end
