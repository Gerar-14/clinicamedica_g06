class ValorReferenciaController < ApplicationController
  before_action :set_valor_referencium, only: %i[ show edit update destroy ]

  # GET /valor_referencia or /valor_referencia.json
  def index
    @valor_referencia = ValorReferencia.all
  end

  # GET /valor_referencia/1 or /valor_referencia/1.json
  def show
  end

  # GET /valor_referencia/new
  def new
    @valor_referencium = ValorReferencia.new
  end

  # GET /valor_referencia/1/edit
  def edit
  end

  # POST /valor_referencia or /valor_referencia.json
  def create
    @valor_referencium = ValorReferencia.new(valor_referencium_params)

    respond_to do |format|
      if @valor_referencium.save
        format.html { redirect_to valor_referencium_url(@valor_referencium), notice: "Valor referencia was successfully created." }
        format.json { render :show, status: :created, location: @valor_referencium }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @valor_referencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /valor_referencia/1 or /valor_referencia/1.json
  def update
    respond_to do |format|
      if @valor_referencium.update(valor_referencium_params)
        format.html { redirect_to valor_referencium_url(@valor_referencium), notice: "Valor referencia was successfully updated." }
        format.json { render :show, status: :ok, location: @valor_referencium }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @valor_referencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /valor_referencia/1 or /valor_referencia/1.json
  def destroy
    @valor_referencium.destroy

    respond_to do |format|
      format.html { redirect_to valor_referencia_index_url, notice: "Valor referencia was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_valor_referencium
      @valor_referencium = ValorReferencia.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def valor_referencium_params
      params.require(:valor_referencium).permit(:valor_referencia, :parametro_id)
    end
end
