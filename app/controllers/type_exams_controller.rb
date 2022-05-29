class TypeExamsController < ApplicationController
  before_action :set_type_exam, only: %i[ show edit update destroy ]

  # GET /type_exams or /type_exams.json
  def index
    @type_exams = TypeExam.all
  end

  # GET /type_exams/1 or /type_exams/1.json
  def show
  end

  # GET /type_exams/new
  def new
    @type_exam = TypeExam.new
  end

  # GET /type_exams/1/edit
  def edit
  end

  # def insertar_area_tipo_examen(idArea, idTipoExamen)
  #   @fecha_actual = Time.now.strftime("%Y-%m-%dT%k:%M")
  #   @area_tipo_examen = AreaTypeExam.find_by_sql(["insert into area_type_exams (area_id, type_exam_id, created_at, updated_at) values (?, ?, ?, ?) ", idArea, idTipoExamen, @fecha_actual, @fecha_actual])
  # end

  # POST /type_exams or /type_exams.json
  def create
    @type_exam = TypeExam.new(type_exam_params)

    respond_to do |format|
      if @type_exam.save
        #format.html { redirect_to type_exam_url(@type_exam), notice: "Type exam was successfully created." }
        format.html { redirect_to new_area_type_exam_path, notice: "Type exam was successfully created." }
        format.json { render :show, status: :created, location: @type_exam }
        # @id_area = Area.select(:id).last(1).to_s.tr('[#<Area id:]>', '')
        # @id_type_exam = TypeExam.select(:id).last(1).to_s.tr('[#<TypeExam id:]>', '')
        # insertar_area_tipo_examen(@id_area,@id_type_exam)
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @type_exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_exams/1 or /type_exams/1.json
  def update
    respond_to do |format|
      if @type_exam.update(type_exam_params)
        format.html { redirect_to type_exam_url(@type_exam), notice: "Type exam was successfully updated." }
        format.json { render :show, status: :ok, location: @type_exam }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @type_exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_exams/1 or /type_exams/1.json
  def destroy
    @type_exam.destroy

    respond_to do |format|
      format.html { redirect_to type_exams_url, notice: "Type exam was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_exam
      @type_exam = TypeExam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def type_exam_params
      params.require(:type_exam).permit(:name_type_examn)
    end
end
