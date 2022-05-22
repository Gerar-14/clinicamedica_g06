class ValorReferenciaController < ApplicationController
  before_action :set_valor_referencia, only: %i[ show edit update destroy ]

  # GET /valor_referencia or /valor_referencia.json
  def index
    @valor_referencia = ValorReferencia.all
  end

  # GET /valor_referencia/1 or /valor_referencia/1.json
  def show
  end

  # GET /valor_referencia/new
  def new
    @valor_referencia = ValorReferencia.new
  end

  # GET /valor_referencia/1/edit
  def edit
  end

  # POST /valor_referencia or /valor_referencia.json
  def create
    @valor_referencia = ValorReferencia.new(valor_referencia_params)

    respond_to do |format|
      if @valor_referencia.save
        format.html { redirect_to valor_referencia_url(@valor_referencia), notice: "Valor referencia was successfully created." }
        format.json { render :show, status: :created, location: @valor_referencia }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @valor_referencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /valor_referencia/1 or /valor_referencia/1.json
  def update
    respond_to do |format|
      if @valor_referencia.update(valor_referencia_params)
        format.html { redirect_to valor_referencia_url(@valor_referencia), notice: "Valor referencia was successfully updated." }
        format.json { render :show, status: :ok, location: @valor_referencia }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @valor_referencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /valor_referencia/1 or /valor_referencia/1.json
  def destroy
    @valor_referencia.destroy

    respond_to do |format|
      format.html { redirect_to valor_referencia_index_url, notice: "Valor referencia was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_valor_referencia
      @valor_referencia = ValorReferencia.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def valor_referencia_params
      params.require(:valor_referencia).permit(:valor_referencia, :parametro_id)
    end
end
