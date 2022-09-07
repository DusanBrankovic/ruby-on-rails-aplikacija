class WorkoutTypesController < ApplicationController
  before_action :require_user_logged_in

  before_action do
    require_user_type('admin_user')
  end

  def show
    @workout_type = WorkoutType.find(params[:id])
  end

  def new
    @workout_type = WorkoutType.new
  end

  def create
    @workout_type = WorkoutType.create(workout_type_params)

    if @workout_type.valid?
      @workout_type.save

      respond_to do |format|
        format.html { redirect_to workout_types_path, success: "Uspesno dodat novi tip treninga." }
        format.json {
          msg = { :status => "OK", :message => "Uspesno kreiran novi tip treninga." }
          render :json => msg, status: :ok
        }
      end
    else
      respond_to do |format|
        format.html {
          @workout_type.errors.full_messages.each do |message|
            flash[:danger] = message
          end
          render :new
        }
        format.json {
          msg = { :status => "ERR", :message => @workout_type.errors.full_messages }
          render :json => msg, status: :unprocessable_entity
        }
      end
    end
  end

  def edit
    @workout_type = WorkoutType.find(params[:id])
  end

  def update
    @workout_type = WorkoutType.find(params[:id])

    if @workout_type.update(workout_type_params)
      respond_to do |format|
        format.html { redirect_to edit_workout_type_path(params[:id]), success: "Uspesno azuriran tip treninga." }
        format.json {
          msg = { :status => "OK", :workout_type => @workout_type }
          render :json => msg, status: :ok
        }
      end
    else
      respond_to do |format|
        format.html {
          @workout_type.errors.full_messages.each do |message|
            flash[:danger] = message
          end
          render :new
        }
        format.json {
          msg = { :status => "ERR", :message => @workout_type.errors.full_messages }
          render :json => msg, status: :unprocessable_entity
        }
      end
    end
  end

  def destroy
    @workout_type = WorkoutType.find(params[:id])

    @workout_type.destroy
    respond_to do |format|
      format.html { redirect_to workout_types_path, success: 'Uspesno obrisan tip treninga.' }
      format.json {
        msg = { :status => "OK", :message => "Uspesno obrisan tip treninga." }
        render :json => msg, status: :ok
      }
    end
  end

  def index
    @workout_types = WorkoutType.paginate(page: params[:page])
  end

  private
  def workout_type_params
    params.require(:workout_type).permit(:name, :description)
  end
end

