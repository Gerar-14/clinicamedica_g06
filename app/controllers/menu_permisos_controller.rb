class MenuPermisosController < ApplicationController
  before_action :set_menu_permiso, only: %i[ show edit update destroy ]

  # GET /menu_permisos or /menu_permisos.json
  def index
    @menu_permisos = MenuPermiso.all
  end

  # GET /menu_permisos/1 or /menu_permisos/1.json
  def show
  end

  # GET /menu_permisos/new
  def new
    @menu_permiso = MenuPermiso.new
  end

  # GET /menu_permisos/1/edit
  def edit
  end

  # POST /menu_permisos or /menu_permisos.json
  def create
    @menu_permiso = MenuPermiso.new(menu_permiso_params)

    respond_to do |format|
      if @menu_permiso.save
        format.html { redirect_to menu_permiso_url(@menu_permiso), notice: "Menu permiso was successfully created." }
        format.json { render :show, status: :created, location: @menu_permiso }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu_permiso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_permisos/1 or /menu_permisos/1.json
  def update
    respond_to do |format|
      if @menu_permiso.update(menu_permiso_params)
        format.html { redirect_to menu_permiso_url(@menu_permiso), notice: "Menu permiso was successfully updated." }
        format.json { render :show, status: :ok, location: @menu_permiso }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menu_permiso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_permisos/1 or /menu_permisos/1.json
  def destroy
    @menu_permiso.destroy

    respond_to do |format|
      format.html { redirect_to menu_permisos_url, notice: "Menu permiso was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_permiso
      @menu_permiso = MenuPermiso.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def menu_permiso_params
      params.require(:menu_permiso).permit(:menu_id, :permiso_id)
    end
end
