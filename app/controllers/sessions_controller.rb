class SessionsController < ApplicationController
  before_action :require_user_not_logged_in, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(email_address: user_params[:email_address]).try(:authenticate, user_params[:password])
    if @user
      session[:user_id] = @user.id

      respond_to do |format|
        format.html { redirect_to root_path }
        format.json {
          msg = { :status => "OK", :user => @user }
          render :json => msg, status: :ok
        }
      end
    else
      respond_to do |format|
        format.html {
          flash[:danger] = "Sifra ili e-mejl nisu tacni. Pokusajte ponovo."
          render :new
        }
        format.json {
          msg = { :status => "ERR", :message => "Profil nije pronadjen." }
          render :json => msg, status: :not_found
        }
      end
    end
  end

  def destroy
    session[:user_id] = nil

    respond_to do |format|
      format.html { redirect_to login_path, info: 'Uspesno ste se odjavili.' }
      format.json {
        msg = { :status => "OK", :message => "Uspesna odjava." }
        render :json => msg, status: :ok
      }
    end

  end

  private
  def user_params
    params.permit(:email_address, :password)
  end
end

