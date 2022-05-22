class PaisController < ApplicationController
  before_action :set_pais, only: %i[ show edit update destroy ]

  # GET /pais or /pais.json
  def index
    @pais = Pais.all
  end

  # GET /pais/1 or /pais/1.json
  def show
  end

  # GET /pais/new
  def new
    @pais = Pais.new
  end

  # GET /pais/1/edit
  def edit
  end

  # POST /pais or /pais.json
  def create
    @pais = Pais.new(pais_params)

    respond_to do |format|
      if @pais.save
        format.html { redirect_to pais_url(@pais), notice: "Pais was successfully created." }
        format.json { render :show, status: :created, location: @pais }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pais.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pais/1 or /pais/1.json
  def update
    respond_to do |format|
      if @pais.update(pais_params)
        format.html { redirect_to pais_url(@pais), notice: "Pais was successfully updated." }
        format.json { render :show, status: :ok, location: @pais }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pais.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pais/1 or /pais/1.json
  def destroy
    @pais.destroy

    respond_to do |format|
      format.html { redirect_to pais_index_url, notice: "Pais was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pais
      @pais = Pais.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pais_params
      params.require(:pais).permit(:nombre_pais)
    end
end
