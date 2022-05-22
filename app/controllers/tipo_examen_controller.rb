class TipoExamenController < ApplicationController
  before_action :set_tipo_examan, only: %i[ show edit update destroy ]

  # GET /tipo_examen or /tipo_examen.json
  def index
    @tipo_examen = TipoExamen.all
  end

  # GET /tipo_examen/1 or /tipo_examen/1.json
  def show
  end

  # GET /tipo_examen/new
  def new
    @tipo_examan = TipoExamen.new
  end

  # GET /tipo_examen/1/edit
  def edit
  end

  # POST /tipo_examen or /tipo_examen.json
  def create
    @tipo_examan = TipoExamen.new(tipo_examan_params)

    respond_to do |format|
      if @tipo_examan.save
        format.html { redirect_to tipo_examan_url(@tipo_examan), notice: "Tipo examen was successfully created." }
        format.json { render :show, status: :created, location: @tipo_examan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tipo_examan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_examen/1 or /tipo_examen/1.json
  def update
    respond_to do |format|
      if @tipo_examan.update(tipo_examan_params)
        format.html { redirect_to tipo_examan_url(@tipo_examan), notice: "Tipo examen was successfully updated." }
        format.json { render :show, status: :ok, location: @tipo_examan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tipo_examan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_examen/1 or /tipo_examen/1.json
  def destroy
    @tipo_examan.destroy

    respond_to do |format|
      format.html { redirect_to tipo_examen_index_url, notice: "Tipo examen was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_examan
      @tipo_examan = TipoExamen.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_examan_params
      params.require(:tipo_examan).permit(:nombre_tipo_examen)
    end
end
