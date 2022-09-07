class EquipmentTypesController < ApplicationController
  before_action :require_user_logged_in

  before_action do
    require_user_type('admin_user')
  end

  def show
    @equipment_type = EquipmentType.find(params[:id])
  end

  def new
    @equipment_type = EquipmentType.new
  end

  def create
    @equipment_type = EquipmentType.create(equipment_type_params)

    if @equipment_type.valid?
      @equipment_type.save

      respond_to do |format|
        format.html { redirect_to equipment_types_path, success: "Uspesno dodat novi tip opreme." }
        format.json {
          msg = { :status => "OK", :message => "Uspesno dodat novi tip opreme." }
          render :json => msg, status: :ok
        }
      end
    else
      respond_to do |format|
        format.html {
          @equipment_type.errors.full_messages.each do |message|
            flash[:danger] = message
          end
          render :new
        }
        format.json {
          msg = { :status => "ERR", :message => @equipment_type.errors.full_messages }
          render :json => msg, status: :unprocessable_entity
        }
      end
    end
  end

  def edit
    @equipment_type = EquipmentType.find(params[:id])
  end

  def update
    @equipment_type = EquipmentType.find(params[:id])

    if @equipment_type.update(equipment_type_params)
      respond_to do |format|
        format.html { redirect_to edit_equipment_type_path(params[:id]), success: "Uspesno azuriran tip opreme." }
        format.json {
          msg = { :status => "OK", :equipment_type => @equipment_type }
          render :json => msg, status: :ok
        }
      end
    else
      respond_to do |format|
        format.html {
          @equipment_type.errors.full_messages.each do |message|
            flash[:danger] = message
          end
          render :new
        }
        format.json {
          msg = { :status => "ERR", :message => @equipment_type.errors.full_messages }
          render :json => msg, status: :unprocessable_entity
        }
      end
    end
  end

  def destroy
    @equipment_type = EquipmentType.find(params[:id])

    @equipment_type.destroy
    respond_to do |format|
      format.html { redirect_to equipment_types_path, success: 'Uspesno obrisan tip opreme.' }
      format.json {
        msg = { :status => "OK", :message => "Uspesno obrisan tip opreme." }
        render :json => msg, status: :ok
      }
    end
  end
  
  def index
    @equipment_types = EquipmentType.paginate(page: params[:page])
  end

  private
  def equipment_type_params
    params.require(:equipment_type).permit(:name, :description)
  end
end
