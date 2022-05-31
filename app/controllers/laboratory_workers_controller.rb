class LaboratoryWorkersController < HomeController
  before_action :set_laboratory_worker, only: %i[ show edit update destroy ]

  # GET /laboratory_workers or /laboratory_workers.json
  def index
    @laboratory_workers = LaboratoryWorker.all

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Mostar el boton crear verde, se le debe poner como argumento 2
    @menu_principal = "laboratory_workers"
    @permisos_crud = get_crud_permisos(@menu_principal, 2)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia seguridad
    @menu_show = LaboratoryWorker.all
    @ruta_local = "/laboratory_workers"
    @direccion = direccionador(@ruta_local,@menu_show)   
    @direccion
    #Finaliza seguridad    
  end

  # GET /laboratory_workers/1 or /laboratory_workers/1.json
  def show
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Inicia mostrar o no boton editar y eliminar
    @menu_principal = "laboratory_workers" #En realidad es de la ruta por eso va plural
    @permisos_crud = get_crud_permisos(@menu_principal, 1)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia Seguridad 
    @menu_detalle = @lboratoryWorker #Singular
    @ruta_local = "/laboratory_workers/:id" #plural
    @direccion = direccionador(@ruta_local,@menu_detalle)   
    @direccion
    #Termina Seguridad    
  end

  # GET /laboratory_workers/new
  def new
    @laboratory_worker = LaboratoryWorker.new

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu = LaboratoryWorker.new #Singular y el primero en mayuscula
    @ruta_local = "/laboratory_workers/new" #plural
    @direccion = direccionador(@ruta_local,@menu)   
    @direccion
    #Finaliza Seguridad    
  end

  # GET /laboratory_workers/1/edit
  def edit
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu_edit = edit_laboratory_worker_path #singular
    @ruta_local = "/laboratory_workers/:id/edit"
    @direccion = direccionador(@ruta_local,@menu_edit)   
    @direccion
    #Finaliza Seguridad    
  end

  # POST /laboratory_workers or /laboratory_workers.json
  def create
    @laboratory_worker = LaboratoryWorker.new(laboratory_worker_params)

    respond_to do |format|
      if @laboratory_worker.save
        format.html { redirect_to laboratory_worker_url(@laboratory_worker), notice: "Laboratory worker was successfully created." }
        format.json { render :show, status: :created, location: @laboratory_worker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @laboratory_worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laboratory_workers/1 or /laboratory_workers/1.json
  def update
    respond_to do |format|
      if @laboratory_worker.update(laboratory_worker_params)
        format.html { redirect_to laboratory_worker_url(@laboratory_worker), notice: "Laboratory worker was successfully updated." }
        format.json { render :show, status: :ok, location: @laboratory_worker }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @laboratory_worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laboratory_workers/1 or /laboratory_workers/1.json
  def destroy

    #definimos la ruta para eliminar
    @ruta_local = "/laboratory_workers/:id"
    @url_delete = @laboratory_worker #Singular
    @url_path = laboratory_workers_url #Plural
    #metodo para determinar si tiene permisos de eliminar 
    direccionador_destroy(@ruta_local, @url_delete, @url_path, "Laboratorista ") #ultimo argumento es para mensaje de exito    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laboratory_worker
      @laboratory_worker = LaboratoryWorker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def laboratory_worker_params
      params.require(:laboratory_worker).permit(:num_junta_vigilancia, :laboratorio_id, :empleado_id)
    end
end
