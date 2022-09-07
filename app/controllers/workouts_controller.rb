class WorkoutsController < ApplicationController
  before_action :require_user_logged_in, except: [:show]

  before_action only: [:index, :destroy] do
    require_user_type('admin_user')
  end

  def show
    @workout = Workout.find(params[:id])

    @exercise = Exercise.new
    @equipment = Equipment.all
  end

  def new
    @workout = Workout.new
    @workout_types = WorkoutType.all
  end

  def create
    @workout = Workout.create(workout_params)

    @workout.user = current_user
    @workout.workout_type_ids = params[:workout_types]

    if @workout.valid?
      @workout.save

      respond_to do |format|
        format.html { redirect_to workouts_path, success: "Uspesno dodat novi trening." }
        format.json {
          msg = { :status => "OK", :message => "Uspesno dodat novi trening." }
          render :json => msg, status: :ok
        }
      end
    else
      respond_to do |format|
        format.html {
          @workout.errors.full_messages.each do |message|
            flash[:danger] = message
          end
          render :new
        }
        format.json {
          msg = { :status => "ERR", :message => @workout.errors.full_messages }
          render :json => msg, status: :unprocessable_entity
        }
      end
    end
  end

  def edit
    @workout = Workout.find(params[:id])
    @workout_types = WorkoutType.all
    guard_self_and_admin(@workout.user)
  end

  def update
    @workout = Workout.find(params[:id])

    guard_self_and_admin(@workout.user)

    @workout.workout_type_ids = params[:workout_types]

    if @workout.update(workout_params)
      respond_to do |format|
        format.html { redirect_to edit_workout_path(params[:id]), success: "Uspesno azuriran trening." }
        format.json {
          msg = { :status => "OK", :workout => @workout }
          render :json => msg, status: :ok
        }
      end
    else
      respond_to do |format|
        format.html {
          @workout.errors.full_messages.each do |message|
            flash[:danger] = message
          end
          render :new
        }
        format.json {
          msg = { :status => "ERR", :message => @workout.errors.full_messages }
          render :json => msg, status: :unprocessable_entity
        }
      end
    end
  end

  def destroy
    @workout = workout.find(params[:id])

    Exercise.destroy_by(workout: @workout)

    @workout.destroy
    @workout.workout_types.destroy
    respond_to do |format|
      format.html { redirect_to workouts_path, success: 'Uspesno obrisan trening.' }
      format.json {
        msg = { :status => "OK", :message => "Uspesno obrisan trening." }
        render :json => msg, status: :ok
      }
    end
  end
  
  def index
    @workouts = Workout.paginate(page: params[:page])
  end

  private
  def workout_params
    params.require(:workout).permit(:name, :description)
  end
end
