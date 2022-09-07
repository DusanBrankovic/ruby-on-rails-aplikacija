class WorkoutWorkoutTypesController < ApplicationController
  before_action :set_workout_workout_type, only: [:show, :edit, :update, :destroy]

  # GET /workout_workout_types
  # GET /workout_workout_types.json
  def index
    @workout_workout_types = WorkoutWorkoutType.all
  end

  # GET /workout_workout_types/1
  # GET /workout_workout_types/1.json
  def show
  end

  # GET /workout_workout_types/new
  def new
    @workout_workout_type = WorkoutWorkoutType.new
  end

  # GET /workout_workout_types/1/edit
  def edit
  end

  # POST /workout_workout_types
  # POST /workout_workout_types.json
  def create
    @workout_workout_type = WorkoutWorkoutType.new(workout_workout_type_params)

    respond_to do |format|
      if @workout_workout_type.save
        format.html { redirect_to @workout_workout_type, notice: 'Workout workout type was successfully created.' }
        format.json { render :show, status: :created, location: @workout_workout_type }
      else
        format.html { render :new }
        format.json { render json: @workout_workout_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workout_workout_types/1
  # PATCH/PUT /workout_workout_types/1.json
  def update
    respond_to do |format|
      if @workout_workout_type.update(workout_workout_type_params)
        format.html { redirect_to @workout_workout_type, notice: 'Workout workout type was successfully updated.' }
        format.json { render :show, status: :ok, location: @workout_workout_type }
      else
        format.html { render :edit }
        format.json { render json: @workout_workout_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workout_workout_types/1
  # DELETE /workout_workout_types/1.json
  def destroy
    @workout_workout_type.destroy
    respond_to do |format|
      format.html { redirect_to workout_workout_types_url, notice: 'Workout workout type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout_workout_type
      @workout_workout_type = WorkoutWorkoutType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def workout_workout_type_params
      params.fetch(:workout_workout_type, {})
    end
end
