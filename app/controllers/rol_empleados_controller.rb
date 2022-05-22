class RolEmpleadosController < ApplicationController
  before_action :set_rol_empleado, only: %i[ show edit update destroy ]

  # GET /rol_empleados or /rol_empleados.json
  def index
    @rol_empleados = RolEmpleado.all
  end

  # GET /rol_empleados/1 or /rol_empleados/1.json
  def show
  end

  # GET /rol_empleados/new
  def new
    @rol_empleado = RolEmpleado.new
  end

  # GET /rol_empleados/1/edit
  def edit
  end

  # POST /rol_empleados or /rol_empleados.json
  def create
    @rol_empleado = RolEmpleado.new(rol_empleado_params)

    respond_to do |format|
      if @rol_empleado.save
        format.html { redirect_to rol_empleado_url(@rol_empleado), notice: "Rol empleado was successfully created." }
        format.json { render :show, status: :created, location: @rol_empleado }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rol_empleado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rol_empleados/1 or /rol_empleados/1.json
  def update
    respond_to do |format|
      if @rol_empleado.update(rol_empleado_params)
        format.html { redirect_to rol_empleado_url(@rol_empleado), notice: "Rol empleado was successfully updated." }
        format.json { render :show, status: :ok, location: @rol_empleado }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rol_empleado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rol_empleados/1 or /rol_empleados/1.json
  def destroy
    @rol_empleado.destroy

    respond_to do |format|
      format.html { redirect_to rol_empleados_url, notice: "Rol empleado was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rol_empleado
      @rol_empleado = RolEmpleado.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rol_empleado_params
      params.require(:rol_empleado).permit(:rol_id, :empleado_id)
    end
end
