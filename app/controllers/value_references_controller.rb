class ValueReferencesController < ApplicationController
  before_action :set_value_reference, only: %i[ show edit update destroy ]

  # GET /value_references or /value_references.json
  def index
    @value_references = ValueReference.all
  end

  # GET /value_references/1 or /value_references/1.json
  def show
  end

  # GET /value_references/new
  def new
    @value_reference = ValueReference.new
  end

  # GET /value_references/1/edit
  def edit
  end

  # POST /value_references or /value_references.json
  def create
    @value_reference = ValueReference.new(value_reference_params)

    respond_to do |format|
      if @value_reference.save
        format.html { redirect_to value_reference_url(@value_reference), notice: "Value reference was successfully created." }
        format.json { render :show, status: :created, location: @value_reference }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @value_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /value_references/1 or /value_references/1.json
  def update
    respond_to do |format|
      if @value_reference.update(value_reference_params)
        format.html { redirect_to value_reference_url(@value_reference), notice: "Value reference was successfully updated." }
        format.json { render :show, status: :ok, location: @value_reference }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @value_reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /value_references/1 or /value_references/1.json
  def destroy
    @value_reference.destroy

    respond_to do |format|
      format.html { redirect_to value_references_url, notice: "Value reference was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_value_reference
      @value_reference = ValueReference.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def value_reference_params
      params.require(:value_reference).permit(:value_reference, :parametro_id)
    end
end
