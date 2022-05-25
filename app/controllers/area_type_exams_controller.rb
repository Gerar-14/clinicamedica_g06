class AreaTypeExamsController < ApplicationController
  before_action :set_area_type_exam, only: %i[ show edit update destroy ]

  # GET /area_type_exams or /area_type_exams.json
  def index
    @area_type_exams = AreaTypeExam.all
  end

  # GET /area_type_exams/1 or /area_type_exams/1.json
  def show
  end

  # GET /area_type_exams/new
  def new
    @area_type_exam = AreaTypeExam.new
  end

  # GET /area_type_exams/1/edit
  def edit
  end

  # POST /area_type_exams or /area_type_exams.json
  def create
    @area_type_exam = AreaTypeExam.new(area_type_exam_params)

    respond_to do |format|
      if @area_type_exam.save
        format.html { redirect_to area_type_exam_url(@area_type_exam), notice: "Area type exam was successfully created." }
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
    @area_type_exam.destroy

    respond_to do |format|
      format.html { redirect_to area_type_exams_url, notice: "Area type exam was successfully destroyed." }
      format.json { head :no_content }
    end
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
