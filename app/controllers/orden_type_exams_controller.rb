class OrdenTypeExamsController < ApplicationController
  before_action :set_orden_type_exam, only: %i[ show edit update destroy]

  # GET /orden_type_exams or /orden_type_exams.json
  def index
    @orden_type_exams = OrdenTypeExam.all
  end

  # GET /orden_type_exams/1 or /orden_type_exams/1.json
  def show
  end

  # GET /orden_type_exams/new
  def new
    @orden_type_exam = OrdenTypeExam.new
  end

  # GET /orden_type_exams/1/edit
  def edit
  end

  def eliminar_ordenes_y_examenes_de_ordenes(idOrdenTipoExamen)
    @orden_examen = OrdenTypeExam.find_by_sql(["delete from orden_type_exams where id in (select id from orden_type_exams where orden_id = ?)", idOrdenTipoExamen])
  end

  def eliminar_orden(idOrden)
    @orden = Orden.find_by_sql(["delete from ordens where id = ?", idOrden])
  end

  # POST /orden_type_exams or /orden_type_exams.json
  def create
    @orden_type_exam = OrdenTypeExam.new(orden_type_exam_params)

    respond_to do |format|
      if @orden_type_exam.save && params[:add_examen]
        #format.html { redirect_to orden_type_exam_url(@orden_type_exam), notice: "Orden type exam was successfully created." }
        format.html { redirect_to new_orden_type_exam_path, notice: "Orden type exam was successfully created." }
        format.json { render :show, status: :created, location: @orden_type_exam }
      elsif params[:finish_examen]
        #format.html { redirect_to orden_type_exam_url(@orden_type_exam), notice: "Orden type exam was successfully created." }
        format.html { redirect_to new_muestra_path, notice: "Muestra." }
        format.json { render :show, status: :created, location: @orden_type_exam }
      elsif params[:delete_examen]
          #@id = OrdenTypeExam.find_by_sql(["SELECT orden_id FROM orden_type_exams ORDER BY orden_id DESC LIMIT 1"])
          @id = OrdenTypeExam.select(:orden_id).last(1).to_s.tr('[#<OrdenTypeExam id: nil, orden_id:]>', '')
          #puts "impresion " + @id.to_s.tr('[#<OrdenTypeExam id: nil, orden_id:]>', '')
          eliminar_ordenes_y_examenes_de_ordenes(@id)
          eliminar_orden(@id)

          format.html { redirect_to new_orden_path, notice: "Proceso eliminado" }
          format.json { head :no_content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @orden_type_exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orden_type_exams/1 or /orden_type_exams/1.json
  def update
    respond_to do |format|
      if @orden_type_exam.update(orden_type_exam_params)
        format.html { redirect_to orden_type_exam_url(@orden_type_exam), notice: "Orden type exam was successfully updated." }
        format.json { render :show, status: :ok, location: @orden_type_exam }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @orden_type_exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orden_type_exams/1 or /orden_type_exams/1.json
  def destroy
    @orden_type_exam.destroy

    respond_to do |format|
      format.html { redirect_to orden_type_exams_url, notice: "Orden type exam was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden_type_exam
      @orden_type_exam = OrdenTypeExam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def orden_type_exam_params
      params.require(:orden_type_exam).permit(:type_exam_id, :orden_id)
    end
end
