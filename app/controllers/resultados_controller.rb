class ResultadosController < ApplicationController
  before_action :set_resultado, only: %i[ show edit update destroy ]

  # GET /resultados or /resultados.json
  def index
    @resultados = Resultado.all
  end

  # GET /resultados/1 or /resultados/1.json
  def show
  end

  # GET /resultados/new
  def new
    @resultado = Resultado.new
  end

  # GET /resultados/1/edit
  def edit
  end

  # POST /resultados or /resultados.json
  def create
    @resultado = Resultado.new(resultado_params)

    respond_to do |format|
      if @resultado.save
        format.html { redirect_to resultado_url(@resultado), notice: "Resultado was successfully created." }
        format.json { render :show, status: :created, location: @resultado }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resultado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resultados/1 or /resultados/1.json
  def update
    respond_to do |format|
      if @resultado.update(resultado_params)
        format.html { redirect_to resultado_url(@resultado), notice: "Resultado was successfully updated." }
        format.json { render :show, status: :ok, location: @resultado }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @resultado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resultados/1 or /resultados/1.json
  def destroy
    @resultado.destroy

    respond_to do |format|
      format.html { redirect_to resultados_url, notice: "Resultado was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resultado
      @resultado = Resultado.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def resultado_params
      params.require(:resultado).permit(:descripcion, :parametro_id, :orden_id)
    end
end
