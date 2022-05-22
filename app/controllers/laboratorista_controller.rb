class LaboratoristaController < ApplicationController
  before_action :set_laboratoristum, only: %i[ show edit update destroy ]

  # GET /laboratorista or /laboratorista.json
  def index
    @laboratorista = Laboratorista.all
  end

  # GET /laboratorista/1 or /laboratorista/1.json
  def show
  end

  # GET /laboratorista/new
  def new
    @laboratoristum = Laboratorista.new
  end

  # GET /laboratorista/1/edit
  def edit
  end

  # POST /laboratorista or /laboratorista.json
  def create
    @laboratoristum = Laboratorista.new(laboratoristum_params)

    respond_to do |format|
      if @laboratoristum.save
        format.html { redirect_to laboratoristum_url(@laboratoristum), notice: "Laboratorista was successfully created." }
        format.json { render :show, status: :created, location: @laboratoristum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @laboratoristum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laboratorista/1 or /laboratorista/1.json
  def update
    respond_to do |format|
      if @laboratoristum.update(laboratoristum_params)
        format.html { redirect_to laboratoristum_url(@laboratoristum), notice: "Laboratorista was successfully updated." }
        format.json { render :show, status: :ok, location: @laboratoristum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @laboratoristum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laboratorista/1 or /laboratorista/1.json
  def destroy
    @laboratoristum.destroy

    respond_to do |format|
      format.html { redirect_to laboratorista_index_url, notice: "Laboratorista was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laboratoristum
      @laboratoristum = Laboratorista.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def laboratoristum_params
      params.require(:laboratoristum).permit(:num_junta_vigilancia, :laboratorio_id, :empleado_id)
    end
end
