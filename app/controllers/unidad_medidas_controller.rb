class UnidadMedidasController < ApplicationController
  before_action :set_unidad_medida, only: %i[ show edit update destroy ]

  # GET /unidad_medidas or /unidad_medidas.json
  def index
    @unidad_medidas = UnidadMedida.all
  end

  # GET /unidad_medidas/1 or /unidad_medidas/1.json
  def show
  end

  # GET /unidad_medidas/new
  def new
    @unidad_medida = UnidadMedida.new
  end

  # GET /unidad_medidas/1/edit
  def edit
  end

  # POST /unidad_medidas or /unidad_medidas.json
  def create
    @unidad_medida = UnidadMedida.new(unidad_medida_params)

    respond_to do |format|
      if @unidad_medida.save
        format.html { redirect_to unidad_medida_url(@unidad_medida), notice: "Unidad medida was successfully created." }
        format.json { render :show, status: :created, location: @unidad_medida }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @unidad_medida.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unidad_medidas/1 or /unidad_medidas/1.json
  def update
    respond_to do |format|
      if @unidad_medida.update(unidad_medida_params)
        format.html { redirect_to unidad_medida_url(@unidad_medida), notice: "Unidad medida was successfully updated." }
        format.json { render :show, status: :ok, location: @unidad_medida }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @unidad_medida.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unidad_medidas/1 or /unidad_medidas/1.json
  def destroy
    @unidad_medida.destroy

    respond_to do |format|
      format.html { redirect_to unidad_medidas_url, notice: "Unidad medida was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unidad_medida
      @unidad_medida = UnidadMedida.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def unidad_medida_params
      params.require(:unidad_medida).permit(:nombre_unidad_medida, :siglas, :sistema_medida, :descripcion_unidad_medida)
    end
end
