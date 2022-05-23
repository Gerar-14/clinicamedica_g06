class OrdenTipoExamenController < ApplicationController
  before_action :set_orden_tipo_examan, only: %i[ show edit update destroy ]

  # GET /orden_tipo_examen or /orden_tipo_examen.json
  def index
    @orden_tipo_examen = OrdenTipoExamen.all
  end

  # GET /orden_tipo_examen/1 or /orden_tipo_examen/1.json
  def show
  end

  # GET /orden_tipo_examen/new
  def new
    @orden_tipo_examan = OrdenTipoExamen.new
  end

  # GET /orden_tipo_examen/1/edit
  def edit
  end

  # POST /orden_tipo_examen or /orden_tipo_examen.json
  def create
    @orden_tipo_examan = OrdenTipoExamen.new(orden_tipo_examan_params)

    respond_to do |format|
      if @orden_tipo_examan.save
        format.html { redirect_to orden_tipo_examan_url(@orden_tipo_examan), notice: "Orden tipo examen was successfully created." }
        format.json { render :show, status: :created, location: @orden_tipo_examan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @orden_tipo_examan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orden_tipo_examen/1 or /orden_tipo_examen/1.json
  def update
    respond_to do |format|
      if @orden_tipo_examan.update(orden_tipo_examan_params)
        format.html { redirect_to orden_tipo_examan_url(@orden_tipo_examan), notice: "Orden tipo examen was successfully updated." }
        format.json { render :show, status: :ok, location: @orden_tipo_examan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @orden_tipo_examan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orden_tipo_examen/1 or /orden_tipo_examen/1.json
  def destroy
    @orden_tipo_examan.destroy

    respond_to do |format|
      format.html { redirect_to orden_tipo_examen_index_url, notice: "Orden tipo examen was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden_tipo_examan
      @orden_tipo_examan = OrdenTipoExamen.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def orden_tipo_examan_params
      params.require(:orden_tipo_examan).permit(:tipo_examen_id, :orden_id)
    end
end