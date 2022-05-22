class TipoSangresController < ApplicationController
  before_action :set_tipo_sangre, only: %i[ show edit update destroy ]

  # GET /tipo_sangres or /tipo_sangres.json
  def index
    @tipo_sangres = TipoSangre.all
  end

  # GET /tipo_sangres/1 or /tipo_sangres/1.json
  def show
  end

  # GET /tipo_sangres/new
  def new
    @tipo_sangre = TipoSangre.new
  end

  # GET /tipo_sangres/1/edit
  def edit
  end

  # POST /tipo_sangres or /tipo_sangres.json
  def create
    @tipo_sangre = TipoSangre.new(tipo_sangre_params)

    respond_to do |format|
      if @tipo_sangre.save
        format.html { redirect_to tipo_sangre_url(@tipo_sangre), notice: "Tipo sangre was successfully created." }
        format.json { render :show, status: :created, location: @tipo_sangre }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tipo_sangre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_sangres/1 or /tipo_sangres/1.json
  def update
    respond_to do |format|
      if @tipo_sangre.update(tipo_sangre_params)
        format.html { redirect_to tipo_sangre_url(@tipo_sangre), notice: "Tipo sangre was successfully updated." }
        format.json { render :show, status: :ok, location: @tipo_sangre }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tipo_sangre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_sangres/1 or /tipo_sangres/1.json
  def destroy
    @tipo_sangre.destroy

    respond_to do |format|
      format.html { redirect_to tipo_sangres_url, notice: "Tipo sangre was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_sangre
      @tipo_sangre = TipoSangre.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_sangre_params
      params.require(:tipo_sangre).permit(:nombre_tipo_sangre)
    end
end
