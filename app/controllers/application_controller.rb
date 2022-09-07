class ApplicationController < ActionController::Base
  include SessionsHelper
  include UsersHelper

  RESULTS_PER_PAGE = 10

  add_flash_types :success, :info, :danger, :warning

  def require_user_logged_in
    unless is_logged_in?
      respond_to do |format|
        format.html { redirect_to login_path }
        format.json {
          msg = { :status => "ERR", :message => "Unauthorized" }
          render :json => msg, status: :unauthorized
        }
      end
    end
  end

  def require_user_not_logged_in
    if is_logged_in?
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json {
          msg = { :status => "ERR", :message => "Forbidden" }
          render :json => msg, status: :forbidden
        }
      end
    end
  end

  def require_user_not_logged_in_or_not_admin
    if is_logged_in?
      unless current_user_type.key == 'admin_user'
        respond_to do |format|
          format.html { redirect_to root_path }
          format.json {
            msg = { :status => "ERR", :message => "Forbidden" }
            render :json => msg, status: :unprocessable_entity
          }
        end
      end
    end
  end

  def require_user_type(key = 'registered_user')
    @user_type = UserType.find_by(key: key)

    unless is_current_user_of_type?(key)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json {
          msg = { :status => "ERR", :message => "Unauthorized" }
          render :json => msg, status: :unauthorized
        }
      end
    end
  end
end

