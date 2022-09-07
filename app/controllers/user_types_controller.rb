class UserTypesController < ApplicationController
  before_action :require_user_logged_in

  before_action do
    require_user_type('admin_user')
  end

  def show
    @user_type = UserType.find(params[:id])
  end

  def new
    @user_type = UserType.new
  end

  def create
    @user_type = UserType.create(user_type_params)

    if @user_type.valid?
      @user_type.save

      respond_to do |format|
        format.html { redirect_to user_types_path, success: "Uspesno dodat novi tip korisnika." }
        format.json {
          msg = { :status => "OK", :message => "Uspesno dodat novi tip korisnika." }
          render :json => msg, status: :ok
        }
      end
    else
      respond_to do |format|
        format.html {
          @user_type.errors.full_messages.each do |message|
            flash[:danger] = message
          end
          render :new
        }
        format.json {
          msg = { :status => "ERR", :message => @user_type.errors.full_messages }
          render :json => msg, status: :unprocessable_entity
        }
      end
    end
  end

  def edit
    @user_type = UserType.find(params[:id])
  end

  def update
    @user_type = UserType.find(params[:id])

    if @user_type.update(user_type_params)
      respond_to do |format|
        format.html { redirect_to edit_user_type_path(params[:id]), success: "Uspesno azuriran tip korisnika." }
        format.json {
          msg = { :status => "OK", :user => @user_type }
          render :json => msg, status: :ok
        }
      end
    else
      respond_to do |format|
        format.html {
          @user_type.errors.full_messages.each do |message|
            flash[:danger] = message
          end
          render :new
        }
        format.json {
          msg = { :status => "ERR", :message => @user_type.errors.full_messages }
          render :json => msg, status: :unprocessable_entity
        }
      end
    end
  end

  def destroy
    @user_type = UserType.find(params[:id])

    if @user_type.id == 1 || @user_type.id == 2
      respond_to do |format|
        format.html { redirect_to user_types_path, danger: 'Primarne tipove korisnika nije moguce obrisati.' }
        format.json {
          msg = { :status => "ERR", :message => "Primarne tipove korisnika nije moguce obrisati." }
          render :json => msg, status: :forbidden
        }
      end
    else
      @user_type.destroy
      respond_to do |format|
        format.html { redirect_to user_types_path, success: 'Uspesno obrisan tip korisnika.' }
        format.json {
          msg = { :status => "OK", :message => "Uspesno obrisan tip korisnika." }
          render :json => msg, status: :ok
        }
      end
    end
  end
  
  def index
    @user_types = UserType.paginate(page: params[:page])
  end


  private
  def user_type_params
    params.require(:user_type).permit(:key, :name)
  end
end

