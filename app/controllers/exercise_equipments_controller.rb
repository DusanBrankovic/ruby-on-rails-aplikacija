class ExerciseEquipmentsController < ApplicationController
  before_action :set_exercise_equipment, only: [:show, :edit, :update, :destroy]

  # GET /exercise_equipments
  # GET /exercise_equipments.json
  def index
    @exercise_equipments = ExerciseEquipment.all
  end

  # GET /exercise_equipments/1
  # GET /exercise_equipments/1.json
  def show
  end

  # GET /exercise_equipments/new
  def new
    @exercise_equipment = ExerciseEquipment.new
  end

  # GET /exercise_equipments/1/edit
  def edit
  end

  # POST /exercise_equipments
  # POST /exercise_equipments.json
  def create
    @exercise_equipment = ExerciseEquipment.new(exercise_equipment_params)

    respond_to do |format|
      if @exercise_equipment.save
        format.html { redirect_to @exercise_equipment, notice: 'Exercise equipment was successfully created.' }
        format.json { render :show, status: :created, location: @exercise_equipment }
      else
        format.html { render :new }
        format.json { render json: @exercise_equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercise_equipments/1
  # PATCH/PUT /exercise_equipments/1.json
  def update
    respond_to do |format|
      if @exercise_equipment.update(exercise_equipment_params)
        format.html { redirect_to @exercise_equipment, notice: 'Exercise equipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @exercise_equipment }
      else
        format.html { render :edit }
        format.json { render json: @exercise_equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercise_equipments/1
  # DELETE /exercise_equipments/1.json
  def destroy
    @exercise_equipment.destroy
    respond_to do |format|
      format.html { redirect_to exercise_equipments_url, notice: 'Exercise equipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise_equipment
      @exercise_equipment = ExerciseEquipment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exercise_equipment_params
      params.fetch(:exercise_equipment, {})
    end
end
