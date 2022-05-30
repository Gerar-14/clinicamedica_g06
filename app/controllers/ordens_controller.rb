class OrdensController < ApplicationController
  before_action :set_orden, only: %i[ show edit update destroy seleccionado]

  # GET /ordens or /ordens.json
  def index
    #@ordens = Orden.all
    @id_usuario_actual = current_user.id
    #Esta consulta SQL hace lo mismo que la linea 11
    #@ordens = Orden.find_by_sql(["SELECT ordens.id, ordens.fecha_examen, ordens.paciente_id, ordens.laboratory_worker_id FROM ordens INNER JOIN laboratory_workers on ordens.laboratory_worker_id = laboratory_workers.id INNER JOIN empleados on laboratory_workers.empleado_id = empleados.id INNER JOIN users on empleados.user_id = users.id WHERE empleados.profesion = 'Laboratorista' and empleados.user_id = ? ", @id_usuario_actual])
    #Esta consulta SQL es con los metodos de ActiveRecord que usa rails
    @ordens = Orden.select(:id,:fecha_examen,:paciente_id,:laboratory_worker_id)
    .joins(laboratory_worker: [empleado: :user])
    .where('empleados.profesion' => 'Laboratorista').where('empleados.user_id' => @id_usuario_actual)
  end

  # GET /ordens/1 or /ordens/1.json
  def show
  end

  # GET /ordens/new
  def new
    @orden = Orden.new
    @orden_fecha_actual = Time.now.strftime("%Y-%m-%dT%k:%M")
    #@labo = Orden.find_by_sql("select laboratory_worker_id,count(laboratory_worker_id) as conteo from ordens WHERE estado = 1 GROUP by laboratory_worker_id")
    #@laboratory_workers = LaboratoryWorker.find_by_sql("select * from laboratory_workers")
    #@laboratory_workers.each do |laboratory_worker|
    #  @labo.each do |l|
    #    if l.laboratory_worker_id != laboratory_worker.id
    #      laboratory_workers.destroy(laboratory_worker);
    #    end
    #  end
    #end
    @laboratoristas = Orden.find_by_sql("SELECT *, count(ordens.laboratory_worker_id) as conteo from ordens INNER JOIN laboratory_workers ON (ordens.laboratory_worker_id =laboratory_workers.id) INNER join empleados on (laboratory_workers.empleado_id = empleados.id) where estado = 1 GROUP by laboratory_worker_id HAVING conteo < 11;")

  end

  # GET /ordens/1/edit
  def edit
  end

  # POST /ordens or /ordens.json
  def create
    @orden = Orden.new(orden_params)

    respond_to do |format|
      if @orden.save
        format.html { redirect_to new_orden_type_exam_path, notice: "Orden was successfully created." }
        format.json { render :show, status: :created, location: @orden }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @orden.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordens/1 or /ordens/1.json
  def update
    respond_to do |format|
      if @orden.update(orden_params)
        format.html { redirect_to orden_url(@orden), notice: "Orden was successfully updated." }
        format.json { render :show, status: :ok, location: @orden }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @orden.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordens/1 or /ordens/1.json
  def destroy
    @orden.destroy

    respond_to do |format|
      format.html { redirect_to ordens_url, notice: "Orden was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def seleccionado
    @orden = Orden.find(params[:id])
    @orden_seleccionada = OrdenTypeExam.find_by_sql(["select * from orden_type_exams where orden_id = ?", @orden])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden
      @orden = Orden.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def orden_params
      params.require(:orden).permit(:fecha_examen, :paciente_id, :laboratory_worker_id)
    end
end
