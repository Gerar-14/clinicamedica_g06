class OrdensController < HomeController
  before_action :set_orden, only: %i[ show edit update destroy seleccionado finalizado]

  # GET /ordens or /ordens.json
  def index
    #Encontraremos el rol del usuario activo
    @usuario = current_user.id
    @empleado = obteniendo_empleado(@usuario)
    @id_rol = rol_empleado(@empleado.id)

    #id_rol = 3 es laboratorista
    #id_rol = 4 es jefe de laboratorista
    #id_rol = 2 recepcionista

    #@ordens = Orden.all
    @id_usuario_actual = current_user.id

    if @id_rol[0] == 3 #Laboratorista
      #Esta consulta SQL hace lo mismo que la linea 11
      #@ordens = Orden.find_by_sql(["SELECT ordens.id, ordens.fecha_examen, ordens.paciente_id, ordens.laboratory_worker_id FROM ordens INNER JOIN laboratory_workers on ordens.laboratory_worker_id = laboratory_workers.id INNER JOIN empleados on laboratory_workers.empleado_id = empleados.id INNER JOIN users on empleados.user_id = users.id WHERE empleados.profesion = 'Laboratorista' and empleados.user_id = ? ", @id_usuario_actual])
      #Esta consulta SQL es con los metodos de ActiveRecord que usa rails
      @ordens = Orden.select(:id,:fecha_examen,:paciente_id,:laboratory_worker_id, :estado)
      .joins(laboratory_worker: [empleado: :user])
      .where('empleados.profesion' => 'Laboratorista').where('empleados.user_id' => @id_usuario_actual)

    elsif @id_rol[0] == 2 #Recepcionista
      @ordens = get_orders_recepcionista()

    elsif @id_rol[0] == 4 #Jefe de laboratorio
      @ordens = Orden.all
    end

  end

  def get_orders_recepcionista()
    @orders_jefes = Orden.find_by_sql(["SELECT * from ordens where estado = 1"])
    return @orders_jefes
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
    # @orden_estado_actualizar = Orden.find_by_sql(["update ordens set ordens.estado = 0 where ordens.id = 
    #   (select DISTINCT orden_id from orden_type_exams where orden_id = ? and orden_type_exams.estado = 1)", @orden])
  end

  def finalizado
    @orden = Orden.find(params[:id])
    @orden_estado_actualizar = Orden.find_by_sql(["update ordens set ordens.estado = 0 where ordens.id in
      (select orden_id from orden_type_exams where orden_id = ? and orden_type_exams.estado = 1)", @orden])

      @id_usuario_actual = current_user.id
    #Esta consulta SQL hace lo mismo que la linea 11
    #@ordens = Orden.find_by_sql(["SELECT ordens.id, ordens.fecha_examen, ordens.paciente_id, ordens.laboratory_worker_id FROM ordens INNER JOIN laboratory_workers on ordens.laboratory_worker_id = laboratory_workers.id INNER JOIN empleados on laboratory_workers.empleado_id = empleados.id INNER JOIN users on empleados.user_id = users.id WHERE empleados.profesion = 'Laboratorista' and empleados.user_id = ? ", @id_usuario_actual])
    #Esta consulta SQL es con los metodos de ActiveRecord que usa rails
    @ordens = Orden.select(:id,:fecha_examen,:paciente_id,:laboratory_worker_id, :estado)
    .joins(laboratory_worker: [empleado: :user])
    .where('empleados.profesion' => 'Laboratorista').where('empleados.user_id' => @id_usuario_actual)
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
