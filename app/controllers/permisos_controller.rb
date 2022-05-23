class PermisosController < ApplicationController
  before_action :set_permiso, only: %i[ show edit update destroy ]

  # GET /permisos or /permisos.json
  def index
    @permisos = Permiso.all
  end

  # GET /permisos/1 or /permisos/1.json
  def show
  end

  # GET /permisos/new
  def new
    @permiso = Permiso.new
  end

  # GET /permisos/1/edit
  def edit
  end

  # POST /permisos or /permisos.json
  def create
    @permiso = Permiso.new(permiso_params)

    respond_to do |format|
      if @permiso.save
        format.html { redirect_to permiso_url(@permiso), notice: "Permiso was successfully created." }
        format.json { render :show, status: :created, location: @permiso }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @permiso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permisos/1 or /permisos/1.json
  def update
    respond_to do |format|
      if @permiso.update(permiso_params)
        format.html { redirect_to permiso_url(@permiso), notice: "Permiso was successfully updated." }
        format.json { render :show, status: :ok, location: @permiso }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @permiso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permisos/1 or /permisos/1.json
  def destroy
    @permiso.destroy

    respond_to do |format|
      format.html { redirect_to permisos_url, notice: "Permiso was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permiso
      @permiso = Permiso.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def permiso_params
      params.require(:permiso).permit(:nombre_permiso, :ruta)
    end
end