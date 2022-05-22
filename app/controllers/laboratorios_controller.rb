class LaboratoriosController < ApplicationController
  before_action :set_laboratorio, only: %i[ show edit update destroy ]

  # GET /laboratorios or /laboratorios.json
  def index
    @laboratorios = Laboratorio.all
  end

  # GET /laboratorios/1 or /laboratorios/1.json
  def show
  end

  # GET /laboratorios/new
  def new
    @laboratorio = Laboratorio.new
  end

  # GET /laboratorios/1/edit
  def edit
  end

  # POST /laboratorios or /laboratorios.json
  def create
    @laboratorio = Laboratorio.new(laboratorio_params)

    respond_to do |format|
      if @laboratorio.save
        format.html { redirect_to laboratorio_url(@laboratorio), notice: "Laboratorio was successfully created." }
        format.json { render :show, status: :created, location: @laboratorio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @laboratorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laboratorios/1 or /laboratorios/1.json
  def update
    respond_to do |format|
      if @laboratorio.update(laboratorio_params)
        format.html { redirect_to laboratorio_url(@laboratorio), notice: "Laboratorio was successfully updated." }
        format.json { render :show, status: :ok, location: @laboratorio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @laboratorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laboratorios/1 or /laboratorios/1.json
  def destroy
    @laboratorio.destroy

    respond_to do |format|
      format.html { redirect_to laboratorios_url, notice: "Laboratorio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laboratorio
      @laboratorio = Laboratorio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def laboratorio_params
      params.require(:laboratorio).permit(:nombre_laboratorio, :municipio_id)
    end
end
