class OrdenTypeExamsController < ApplicationController
  before_action :set_orden_type_exam, only: %i[ show edit update destroy ]

  # GET /orden_type_exams or /orden_type_exams.json
  def index
    @orden_type_exams = OrdenTypeExam.all
  end

  # GET /orden_type_exams/1 or /orden_type_exams/1.json
  def show
  end

  # GET /orden_type_exams/new
  def new
    @orden_type_exam = OrdenTypeExam.new
  end

  # GET /orden_type_exams/1/edit
  def edit
  end

  # POST /orden_type_exams or /orden_type_exams.json
  def create
    @orden_type_exam = OrdenTypeExam.new(orden_type_exam_params)

    respond_to do |format|
      if @orden_type_exam.save && params[:add_examen]
        #format.html { redirect_to orden_type_exam_url(@orden_type_exam), notice: "Orden type exam was successfully created." }
        format.html { redirect_to new_orden_type_exam_path, notice: "Orden type exam was successfully created." }
        format.json { render :show, status: :created, location: @orden_type_exam }
      elsif @orden_type_exam.save && params[:finish_examen]
        #format.html { redirect_to orden_type_exam_url(@orden_type_exam), notice: "Orden type exam was successfully created." }
        format.html { redirect_to new_muestra_path, notice: "Muestra." }
        format.json { render :show, status: :created, location: @orden_type_exam }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @orden_type_exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orden_type_exams/1 or /orden_type_exams/1.json
  def update
    respond_to do |format|
      if @orden_type_exam.update(orden_type_exam_params)
        format.html { redirect_to orden_type_exam_url(@orden_type_exam), notice: "Orden type exam was successfully updated." }
        format.json { render :show, status: :ok, location: @orden_type_exam }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @orden_type_exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orden_type_exams/1 or /orden_type_exams/1.json
  def destroy
    @orden_type_exam.destroy

    respond_to do |format|
      format.html { redirect_to orden_type_exams_url, notice: "Orden type exam was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden_type_exam
      @orden_type_exam = OrdenTypeExam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def orden_type_exam_params
      params.require(:orden_type_exam).permit(:type_exam_id, :orden_id)
    end
end
