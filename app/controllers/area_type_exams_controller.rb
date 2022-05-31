class AreaTypeExamsController < HomeController
  before_action :set_area_type_exam, only: %i[ show edit update destroy ]

  # GET /area_type_exams or /area_type_exams.json
  def index
    @area_type_exams = AreaTypeExam.all

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Mostar el boton crear verde, se le debe poner como argumento 2
    @menu_principal = "area_type_exams"
    @permisos_crud = get_crud_permisos(@menu_principal, 2)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia seguridad
    @menu_show = AreaTypeExam.all
    @ruta_local = "/area_type_exams"
    @direccion = direccionador(@ruta_local,@menu_show)   
    @direccion
    #Finaliza seguridad    
  end

  # GET /area_type_exams/1 or /area_type_exams/1.json
  def show
   #ASIDE
   @menu_rol_nav = menus_y_submenus_usuario(1)

   #Inicia mostrar o no boton editar y eliminar
   @menu_principal = "area_type_exams" #En realidad es de la ruta por eso va plural
   @permisos_crud = get_crud_permisos(@menu_principal, 1)
   #finaliza mostrar o no boton editar y eliminar

   #Inicia Seguridad 
   @menu_detalle = @area_type_exam #Singular
   @ruta_local = "/area_type_exams/:id" #plural
   @direccion = direccionador(@ruta_local,@menu_detalle)   
   @direccion
   #Termina Seguridad    
  end

  # GET /area_type_exams/new
  def new
    @area_type_exam = AreaTypeExam.new

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

 
  end

  # GET /area_type_exams/1/edit
  def edit
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu_edit = edit_area_type_exam_path #singular
    @ruta_local = "/area_type_exams/:id/edit"
    @direccion = direccionador(@ruta_local,@menu_edit)   
    @direccion
    #Finaliza Seguridad    
  end

  # POST /area_type_exams or /area_type_exams.json
  def create
    @area_type_exam = AreaTypeExam.new(area_type_exam_params)

    respond_to do |format|
      if @area_type_exam.save
        #format.html { redirect_to area_type_exam_url(@area_type_exam), notice: "Area type exam was successfully created." }
        format.html { redirect_to new_parametro_path, notice: "Area type exam was successfully created." }
        format.json { render :show, status: :created, location: @area_type_exam }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @area_type_exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /area_type_exams/1 or /area_type_exams/1.json
  def update
    respond_to do |format|
      if @area_type_exam.update(area_type_exam_params)
        format.html { redirect_to area_type_exam_url(@area_type_exam), notice: "Area type exam was successfully updated." }
        format.json { render :show, status: :ok, location: @area_type_exam }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @area_type_exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /area_type_exams/1 or /area_type_exams/1.json
  def destroy
   #definimos la ruta para eliminar
   @ruta_local = "/area_type_exams/:id"
   @url_delete = @area_type_exam #Singular
   @url_path = area_type_exams_url #Plural
   #metodo para determinar si tiene permisos de eliminar 
   direccionador_destroy(@ruta_local, @url_delete, @url_path, "Area del examen ") #ultimo argumento es para mensaje de exito    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area_type_exam
      @area_type_exam = AreaTypeExam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def area_type_exam_params
      params.require(:area_type_exam).permit(:area_id, :type_exam_id)
    end
end
