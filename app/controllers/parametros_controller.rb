class ParametrosController < HomeController
  before_action :set_parametro, only: %i[ show edit update destroy ]

  # GET /parametros or /parametros.json
  def index
    @parametros = Parametro.all

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Mostar el boton crear verde, se le debe poner como argumento 2
    @menu_principal = "parametros"
    @permisos_crud = get_crud_permisos(@menu_principal, 2)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia seguridad
    @menu_show = Parametro.all
    @ruta_local = "/parametros"
    @direccion = direccionador(@ruta_local,@menu_show)   
    @direccion
    #Finaliza seguridad        
  end

  # GET /parametros/1 or /parametros/1.json
  def show
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Inicia mostrar o no boton editar y eliminar
    @menu_principal = "/parametros/" #En realidad es de la ruta por eso va plural
    @permisos_crud = get_crud_permisos(@menu_principal, 1)
    #finaliza mostrar o no boton editar y eliminar

    #Inicia Seguridad 
    @menu_detalle = @parametro #Singular
    @ruta_local = "/parametros/:id" #plural
    @direccion = direccionador(@ruta_local,@menu_detalle)   
    @direccion
    #Termina Seguridad    
  end

  # GET /parametros/new
  def new
    @parametro = Parametro.new
    @id_type_examn = TypeExam.select(:id).last(1).to_s.tr('[#<TypeExam id:]>', '')
    @condicion_parametro = TypeExamParametro.find_by_sql(["select id, nombre_parametro from parametros where id in ( select parametro_id from type_exam_parametros where type_exam_id = ? )", @id_type_examn])
    @hash_parametros = parametros_padre_hijo_by_type_exam(@id_type_examn)

    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu = Parametro.new #Singular y el primero en mayuscula
    @ruta_local = "/parametros/new" #plural
    @direccion = direccionador(@ruta_local,@menu)   
    @direccion
    #Finaliza Seguridad    
  end

  def parametros_padre_hijo_by_type_exam(idTypeExam)
    @parametros_padre = Parametro.find_by_sql(["select parametros.id, parametros.nombre_parametro from parametros join (select * from type_exam_parametros
where type_exam_id = ?) tep on parametros.id = tep.parametro_id", idTypeExam])

    @hash_return = {}
    @list_params = []
    @parametros_padre.each do | param_padre |
      @padre_hash = {}
      @padre_hash["id"] = param_padre.id
      @padre_hash["nombre_parametro_padre"] = param_padre.nombre_parametro
      @parametros_hijo = Parametro.find_by_sql(["select id, nombre_parametro from parametros where parametro_id = ?", param_padre.id])
      @hijos_values = []
      @parametros_hijo.each do | param_hijo |
        @hijo_hash = {}
        @hijo_hash["id"] = param_hijo.id
        @hijo_hash["nombre_parametro_hijo"] = param_hijo.nombre_parametro
        @hijos_values << @hijo_hash
      end
      @padre_hash["hijos"] = @hijos_values
      @list_params << @padre_hash
    end
    # puts(@list_params)
  end

  # GET /parametros/1/edit
  def edit
    #ASIDE
    @menu_rol_nav = menus_y_submenus_usuario(1)

    #Iniciar Seguridad
    @menu_edit = edit_parametro_path #singular
    @ruta_local = "/parametros/:id/edit"
    @direccion = direccionador(@ruta_local,@menu_edit)   
    @direccion
    #Finaliza Seguridad    
  end

  def insertar_tipo_examen_parametro1(idParametro, idTipoExamen)
    @fecha_actual = Time.now.strftime("%Y-%m-%dT%k:%M")
    @area_tipo_examen = TypeExamParametro.find_by_sql(["insert into type_exam_parametros (parametro_id, type_exam_id, created_at, updated_at) values (?, ?, '2022-05-17 17:47:44.000000', '2022-05-17 17:47:44.000000') ", idParametro, idTipoExamen])
  end

  def insertar_tipo_examen_parametro(idParametro, idTipoExamen)
    @fecha_actual = Time.now.strftime("%Y-%m-%dT%k:%M")
    #@area_tipo_examen = TypeExamParametro.find_by_sql(["insert into type_exam_parametros (parametro_id, type_exam_id, created_at, updated_at) values (?, ?, ?, ?) ", idParametro, idTipoExamen, @fecha_actual, @fecha_actual])
    @area_tipo_examen = TypeExamParametro.find_by_sql([" 
      insert into type_exam_parametros (parametro_id, type_exam_id, created_at, updated_at) 
      select ?, ?, '2022-05-17 17:47:44.000000', '2022-05-17 17:47:44.000000'
      from type_exam_parametros 
      where not exists (select type_exam_id from type_exam_parametros where type_exam_id = ?) limit 1 ", idParametro, idTipoExamen, idTipoExamen])
  end

  # POST /parametros or /parametros.json
  def create
    @parametro = Parametro.new(parametro_params)
    
    respond_to do |format|
      if @parametro.save && params[:parametro][:parametro_id] == ''
        #format.html { redirect_to parametro_url(@parametro), notice: "Parametro was successfully created." }
        format.html { redirect_to new_parametro_path, notice: "Parametro was successfully created." }
        format.json { render :show, status: :created, location: @parametro }
        @id_parametro = Parametro.select(:id).last(1).to_s.tr('[#<Parametro id:]>', '')
        @id_type_exam = TypeExam.select(:id).last(1).to_s.tr('[#<TypeExam id:]>', '')
        insertar_tipo_examen_parametro1(@id_parametro,@id_type_exam)
      elsif @parametro.save && params[:parametro][:parametro_id] != ''
        #format.html { redirect_to parametro_url(@parametro), notice: "Parametro was successfully created." }
        format.html { redirect_to new_parametro_path, notice: "Parametro was successfully created." }
        format.json { render :show, status: :created, location: @parametro }
        #@id_parametro = Parametro.select(:id).last(1).to_s.tr('[#<Parametro id:]>', '')
        #@id_type_exam = TypeExam.select(:id).last(1).to_s.tr('[#<TypeExam id:]>', '')
        #insertar_tipo_examen_parametro(@id_parametro,@id_type_exam)
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parametro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parametros/1 or /parametros/1.json
  def update
    respond_to do |format|
      if @parametro.update(parametro_params)
        format.html { redirect_to parametro_url(@parametro), notice: "Parametro was successfully updated." }
        format.json { render :show, status: :ok, location: @parametro }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parametro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parametros/1 or /parametros/1.json
  def destroy
   #definimos la ruta para eliminar
   @ruta_local = "/parametros/:id"
   @url_delete = @parametro #Singular
   @url_path = parametros_url #Plural
   #metodo para determinar si tiene permisos de eliminar 
   direccionador_destroy(@ruta_local, @url_delete, @url_path, "Parametro ") #ultimo argumento es para mensaje de exito    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parametro
      @parametro = Parametro.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parametro_params
      params.require(:parametro).permit(:nombre_parametro, :tipo_parametro, :unidad_medida_id, :parametro_id)
    end
end
