class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit, :update, :destroy]
  before_action :require_user_not_logged_in_or_not_admin, only: [:new, :create]

  before_action only: [:index, :destroy] do
    require_user_type('admin_user')
  end

  def show
    @user = User.find(params[:id])

    guard_self_and_admin(@user)
  end

  def new
    @user = User.new
    @user_types = UserType.all
  end

  def create
    @user = User.create(user_params)

    if is_logged_in? && is_current_user_of_type?('admin_user')
      @user.user_type_id = params[:user_type]
    else
      @user.user_type_id = 2
    end

    if @user.valid?
      @user.save

      respond_to do |format|
        format.html { redirect_to new_session_path, success: "Uspesna registracija. Mozete se prijaviti." }
        format.json {
          msg = { :status => "OK", :message => "Uspesna registracija." }
          render :json => msg, status: :ok
        }
      end
    else
      respond_to do |format|
        format.html {
          @user.errors.full_messages.each do |message|
            flash[:danger] = message
          end
          render :new
        }
        format.json {
          msg = { :status => "ERR", :message => @user.errors.full_messages }
          render :json => msg, status: :unprocessable_entity
        }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
    @user_types = UserType.all
    guard_self_and_admin(@user)
  end

  def update
    @user = User.find(params[:id])

    guard_self_and_admin(@user)

    if is_logged_in? && is_current_user_of_type?('admin_user')
      @user.user_type_id = params[:user_type]
    else
      @user.user_type_id = 2
    end

    if @user.update(user_params)
      respond_to do |format|
        format.html { redirect_to edit_user_path(params[:id]), success: "Uspesno azurirani korisnicki podaci." }
        format.json {
          msg = { :status => "OK", :user => @user }
          render :json => msg, status: :ok
        }
      end
    else
      respond_to do |format|
        format.html {
          @user.errors.full_messages.each do |message|
            flash[:danger] = message
          end
          render :new
        }
        format.json {
          msg = { :status => "ERR", :message => @user.errors.full_messages }
          render :json => msg, status: :unprocessable_entity
        }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user == current_user
      respond_to do |format|
        format.html { redirect_to users_path, warning: 'Nije dozvoljeno brisanje sopstvenog korisnickog naloga.' }
        format.json {
          msg = { :status => "ERR", :message => "Nije dozvoljeno brisanje sopstvenog korisnickog naloga." }
          render :json => msg, status: :forbidden
        }
      end
    else
      if Workout.where(user_id: @user.id).exists?
        respond_to do |format|
          format.html { redirect_to users_path, warning: 'Nije moguce obrisati korisnika koji ima objavljene treninge.' }
          format.json {
            msg = { :status => "ERR", :message => "Nije moguce obrisati korisnika koji ima objavljene treninge." }
            render :json => msg, status: :unprocessable_entity
          }
        end
        return
      end

      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_path, success: 'Uspesno obrisan korisnicki nalog.' }
        format.json {
          msg = { :status => "OK", :message => "Uspesno obrisan korisnicki nalog." }
          render :json => msg, status: :ok
        }
      end
    end
  end
  
  def index
    @users = User.paginate(page: params[:page])
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email_address, :password)
  end
end