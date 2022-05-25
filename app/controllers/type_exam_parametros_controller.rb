class TypeExamParametrosController < ApplicationController
  before_action :set_type_exam_parametro, only: %i[ show edit update destroy ]

  # GET /type_exam_parametros or /type_exam_parametros.json
  def index
    @type_exam_parametros = TypeExamParametro.all
  end

  # GET /type_exam_parametros/1 or /type_exam_parametros/1.json
  def show
  end

  # GET /type_exam_parametros/new
  def new
    @type_exam_parametro = TypeExamParametro.new
  end

  # GET /type_exam_parametros/1/edit
  def edit
  end

  # POST /type_exam_parametros or /type_exam_parametros.json
  def create
    @type_exam_parametro = TypeExamParametro.new(type_exam_parametro_params)

    respond_to do |format|
      if @type_exam_parametro.save
        format.html { redirect_to type_exam_parametro_url(@type_exam_parametro), notice: "Type exam parametro was successfully created." }
        format.json { render :show, status: :created, location: @type_exam_parametro }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @type_exam_parametro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_exam_parametros/1 or /type_exam_parametros/1.json
  def update
    respond_to do |format|
      if @type_exam_parametro.update(type_exam_parametro_params)
        format.html { redirect_to type_exam_parametro_url(@type_exam_parametro), notice: "Type exam parametro was successfully updated." }
        format.json { render :show, status: :ok, location: @type_exam_parametro }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @type_exam_parametro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_exam_parametros/1 or /type_exam_parametros/1.json
  def destroy
    @type_exam_parametro.destroy

    respond_to do |format|
      format.html { redirect_to type_exam_parametros_url, notice: "Type exam parametro was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_exam_parametro
      @type_exam_parametro = TypeExamParametro.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def type_exam_parametro_params
      params.require(:type_exam_parametro).permit(:parametro_id, :type_exam_id)
    end
end
