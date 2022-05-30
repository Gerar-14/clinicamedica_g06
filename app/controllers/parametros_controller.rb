class ParametrosController < ApplicationController
  before_action :set_parametro, only: %i[ show edit update destroy ]

  # GET /parametros or /parametros.json
  def index
    @parametros = Parametro.all
    
  end

  # GET /parametros/1 or /parametros/1.json
  def show
  end

  # GET /parametros/new
  def new
    @parametro = Parametro.new
    @id_type_examn = TypeExam.select(:id).last(1).to_s.tr('[#<TypeExam id:]>', '')
    @condicion_parametro = TypeExamParametro.find_by_sql(["select id, nombre_parametro from parametros where id in ( select parametro_id from type_exam_parametros where type_exam_id = ? )", @id_type_examn])
    @hash_parametros = parametros_padre_hijo_by_type_exam(@id_type_examn)
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
    @parametro.destroy

    respond_to do |format|
      format.html { redirect_to parametros_url, notice: "Parametro was successfully destroyed." }
      format.json { head :no_content }
    end
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
