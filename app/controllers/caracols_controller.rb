class CaracolsController < ApplicationController
  before_action :set_caracol, only: %i[ show edit update destroy ]

  # GET /caracols or /caracols.json
  def index
    @caracols = Caracol.all
  end

  # GET /caracols/1 or /caracols/1.json
  def show
  end

  # GET /caracols/new
  def new
    @caracol = Caracol.new
  end

  # GET /caracols/1/edit
  def edit
  end

  # POST /caracols or /caracols.json
  def create
    @caracol = Caracol.new(caracol_params)

    respond_to do |format|
      if @caracol.save
        format.html { redirect_to caracol_url(@caracol), notice: "Caracol was successfully created." }
        format.json { render :show, status: :created, location: @caracol }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @caracol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caracols/1 or /caracols/1.json
  def update
    respond_to do |format|
      if @caracol.update(caracol_params)
        format.html { redirect_to caracol_url(@caracol), notice: "Caracol was successfully updated." }
        format.json { render :show, status: :ok, location: @caracol }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @caracol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caracols/1 or /caracols/1.json
  def destroy
    @caracol.destroy

    respond_to do |format|
      format.html { redirect_to caracols_url, notice: "Caracol was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caracol
      @caracol = Caracol.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def caracol_params
      params.require(:caracol).permit(:nombre)
    end
end
