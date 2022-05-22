class LaboratoristaController < ApplicationController
  before_action :set_laboratorista, only: %i[ show edit update destroy ]

  # GET /laboratorista or /laboratorista.json
  def index
    @laboratorista = Laboratorista.all
  end

  # GET /laboratorista/1 or /laboratorista/1.json
  def show
  end

  # GET /laboratorista/new
  def new
    @laboratorista = Laboratorista.new
  end

  # GET /laboratorista/1/edit
  def edit
  end

  # POST /laboratorista or /laboratorista.json
  def create
    @laboratorista = Laboratorista.new(laboratorista_params)

    respond_to do |format|
      if @laboratorista.save
        format.html { redirect_to laboratorista_url(@laboratorista), notice: "Laboratorista was successfully created." }
        format.json { render :show, status: :created, location: @laboratorista }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @laboratorista.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laboratorista/1 or /laboratorista/1.json
  def update
    respond_to do |format|
      if @laboratorista.update(laboratorista_params)
        format.html { redirect_to laboratorista_url(@laboratorista), notice: "Laboratorista was successfully updated." }
        format.json { render :show, status: :ok, location: @laboratorista }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @laboratorista.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laboratorista/1 or /laboratorista/1.json
  def destroy
    @laboratorista.destroy

    respond_to do |format|
      format.html { redirect_to laboratorista_index_url, notice: "Laboratorista was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laboratorista
      @laboratorista = Laboratorista.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def laboratorista_params
      params.require(:laboratorista).permit(:num_junta_vigilancia, :laboratorio_id, :empleado_id)
    end
end
