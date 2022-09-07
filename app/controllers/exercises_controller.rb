class ExercisesController < ApplicationController
  before_action :require_user_logged_in

  def create
    @exercise = Exercise.create(exercise_params)
    @workout = Workout.find(exercise_params[:workout_id])

    guard_self_and_admin(@workout.user)

    @exercise.workout = @workout

    if @exercise.valid?
      @exercise.save

      respond_to do |format|
        format.html { redirect_to workout_path(@workout.id), success: "Uspesno kreirana nova vezba." }
        format.json {
          msg = { :status => "OK", :message => "Uspesno kreirana nova vezba." }
          render :json => msg, status: :ok
        }
      end
    else
      respond_to do |format|
        format.html {
          @exercise.errors.full_messages.each do |message|
            flash[:danger] = message
          end
          redirect_to workout_path(@workout.id)
        }
        format.json {
          msg = { :status => "ERR", :message => @exercise.errors.full_messages }
          render :json => msg, status: :unprocessable_entity
        }
      end
    end
  end

  private
  def exercise_params
    params.require(:exercise).permit(:workout_id, :name, :description, :timer, :equipment_ids => [])
  end
end
