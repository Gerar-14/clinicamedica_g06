class TipoExamenParametrosController < ApplicationController
  before_action :set_tipo_examen_parametro, only: %i[ show edit update destroy ]

  # GET /tipo_examen_parametros or /tipo_examen_parametros.json
  def index
    @tipo_examen_parametros = TipoExamenParametro.all
  end

  # GET /tipo_examen_parametros/1 or /tipo_examen_parametros/1.json
  def show
  end

  # GET /tipo_examen_parametros/new
  def new
    @tipo_examen_parametro = TipoExamenParametro.new
  end

  # GET /tipo_examen_parametros/1/edit
  def edit
  end

  # POST /tipo_examen_parametros or /tipo_examen_parametros.json
  def create
    @tipo_examen_parametro = TipoExamenParametro.new(tipo_examen_parametro_params)

    respond_to do |format|
      if @tipo_examen_parametro.save
        format.html { redirect_to tipo_examen_parametro_url(@tipo_examen_parametro), notice: "Tipo examen parametro was successfully created." }
        format.json { render :show, status: :created, location: @tipo_examen_parametro }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tipo_examen_parametro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_examen_parametros/1 or /tipo_examen_parametros/1.json
  def update
    respond_to do |format|
      if @tipo_examen_parametro.update(tipo_examen_parametro_params)
        format.html { redirect_to tipo_examen_parametro_url(@tipo_examen_parametro), notice: "Tipo examen parametro was successfully updated." }
        format.json { render :show, status: :ok, location: @tipo_examen_parametro }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tipo_examen_parametro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_examen_parametros/1 or /tipo_examen_parametros/1.json
  def destroy
    @tipo_examen_parametro.destroy

    respond_to do |format|
      format.html { redirect_to tipo_examen_parametros_url, notice: "Tipo examen parametro was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_examen_parametro
      @tipo_examen_parametro = TipoExamenParametro.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_examen_parametro_params
      params.require(:tipo_examen_parametro).permit(:parametro_id, :tipo_examen_id)
    end
end
