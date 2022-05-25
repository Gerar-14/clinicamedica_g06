class LaboratoryWorkersController < ApplicationController
  before_action :set_laboratory_worker, only: %i[ show edit update destroy ]

  # GET /laboratory_workers or /laboratory_workers.json
  def index
    @laboratory_workers = LaboratoryWorker.all
  end

  # GET /laboratory_workers/1 or /laboratory_workers/1.json
  def show
  end

  # GET /laboratory_workers/new
  def new
    @laboratory_worker = LaboratoryWorker.new
  end

  # GET /laboratory_workers/1/edit
  def edit
  end

  # POST /laboratory_workers or /laboratory_workers.json
  def create
    @laboratory_worker = LaboratoryWorker.new(laboratory_worker_params)

    respond_to do |format|
      if @laboratory_worker.save
        format.html { redirect_to laboratory_worker_url(@laboratory_worker), notice: "Laboratory worker was successfully created." }
        format.json { render :show, status: :created, location: @laboratory_worker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @laboratory_worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laboratory_workers/1 or /laboratory_workers/1.json
  def update
    respond_to do |format|
      if @laboratory_worker.update(laboratory_worker_params)
        format.html { redirect_to laboratory_worker_url(@laboratory_worker), notice: "Laboratory worker was successfully updated." }
        format.json { render :show, status: :ok, location: @laboratory_worker }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @laboratory_worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laboratory_workers/1 or /laboratory_workers/1.json
  def destroy
    @laboratory_worker.destroy

    respond_to do |format|
      format.html { redirect_to laboratory_workers_url, notice: "Laboratory worker was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laboratory_worker
      @laboratory_worker = LaboratoryWorker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def laboratory_worker_params
      params.require(:laboratory_worker).permit(:num_junta_vigilancia, :laboratorio_id, :empleado_id)
    end
end
