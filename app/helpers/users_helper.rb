module UsersHelper

  def current_user_type
    @current_user_type ||= current_user.user_type
  end

  def is_current_user_of_type?(user_type)
    (current_user_type.key == user_type)
  end

  def guard_self_and_admin(user)
    unless @current_user == user || current_user_type.key == 'admin_user'
      respond_to do |format|
        format.html { redirect_to root_path, danger: 'Došlo je do greške!' }
        format.json {
          msg = { :status => "ERR", :message => "Unauthorized" }
          render :json => msg, status: :unauthorized
        }
      end
    end
  end
end

