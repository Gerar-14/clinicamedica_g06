class TipoExamenController < ApplicationController
  before_action :set_tipo_examen, only: %i[ show edit update destroy ]

  # GET /tipo_examen or /tipo_examen.json
  def index
    @tipo_examen = TipoExamen.all
  end

  # GET /tipo_examen/1 or /tipo_examen/1.json
  def show
  end

  # GET /tipo_examen/new
  def new
    @tipo_examen = TipoExamen.new
  end

  # GET /tipo_examen/1/edit
  def edit
  end

  # POST /tipo_examen or /tipo_examen.json
  def create
    @tipo_examen = TipoExamen.new(tipo_examen_params)

    respond_to do |format|
      if @tipo_examen.save
        format.html { redirect_to tipo_examen_url(@tipo_examen), notice: "Tipo examen was successfully created." }
        format.json { render :show, status: :created, location: @tipo_examen }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tipo_examen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_examen/1 or /tipo_examen/1.json
  def update
    respond_to do |format|
      if @tipo_examen.update(tipo_examen_params)
        format.html { redirect_to tipo_examen_url(@tipo_examen), notice: "Tipo examen was successfully updated." }
        format.json { render :show, status: :ok, location: @tipo_examen }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tipo_examen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_examen/1 or /tipo_examen/1.json
  def destroy
    @tipo_examen.destroy

    respond_to do |format|
      format.html { redirect_to tipo_examen_index_url, notice: "Tipo examen was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_examen
      @tipo_examen = TipoExamen.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_examen_params
      params.require(:tipo_examen).permit(:nombre_tipo_examen)
    end
end
