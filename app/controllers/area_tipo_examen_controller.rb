class AreaTipoExamenController < ApplicationController
  before_action :set_area_tipo_examan, only: %i[ show edit update destroy ]

  # GET /area_tipo_examen or /area_tipo_examen.json
  def index
    @area_tipo_examen = AreaTipoExamen.all
  end

  # GET /area_tipo_examen/1 or /area_tipo_examen/1.json
  def show
  end

  # GET /area_tipo_examen/new
  def new
    @area_tipo_examan = AreaTipoExamen.new
  end

  # GET /area_tipo_examen/1/edit
  def edit
  end

  # POST /area_tipo_examen or /area_tipo_examen.json
  def create
    @area_tipo_examan = AreaTipoExamen.new(area_tipo_examan_params)

    respond_to do |format|
      if @area_tipo_examan.save
        format.html { redirect_to area_tipo_examan_url(@area_tipo_examan), notice: "Area tipo examen was successfully created." }
        format.json { render :show, status: :created, location: @area_tipo_examan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @area_tipo_examan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /area_tipo_examen/1 or /area_tipo_examen/1.json
  def update
    respond_to do |format|
      if @area_tipo_examan.update(area_tipo_examan_params)
        format.html { redirect_to area_tipo_examan_url(@area_tipo_examan), notice: "Area tipo examen was successfully updated." }
        format.json { render :show, status: :ok, location: @area_tipo_examan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @area_tipo_examan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /area_tipo_examen/1 or /area_tipo_examen/1.json
  def destroy
    @area_tipo_examan.destroy

    respond_to do |format|
      format.html { redirect_to area_tipo_examen_index_url, notice: "Area tipo examen was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area_tipo_examan
      @area_tipo_examan = AreaTipoExamen.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def area_tipo_examan_params
      params.require(:area_tipo_examan).permit(:area_id, :tipo_examen_id)
    end
end