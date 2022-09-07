class EquipmentController < ApplicationController
  before_action :require_user_logged_in, except: [:show]

  before_action except: [:show] do
    require_user_type('admin_user')
  end

  def show
    @equipment = Equipment.find(params[:id])
  end

  def new
    @equipment = Equipment.new
    @equipment_types = EquipmentTypes.all
  end

  def create
    @equipment = Equipment.create(equipment_params)

    @equipment.equipment_type_ids = params[:equipment_types]

    if @equipment.valid?
      @equipment.save

      respond_to do |format|
        format.html { redirect_to equipment_path, success: "Uspesno dodata novu opremu." }
        format.json {
          msg = { :status => "OK", :message => "Uspesno dodata nova oprema." }
          render :json => msg, status: :ok
        }
      end
    else
      respond_to do |format|
        format.html {
          @equipment.errors.full_messages.each do |message|
            flash[:danger] = message
          end
          render :new
        }
        format.json {
          msg = { :status => "ERR", :message => @equipment.errors.full_messages }
          render :json => msg, status: :unprocessable_entity
        }
      end
    end
  end

  def edit
    @equipment = Equipment.find(params[:id])
    @equipment_types = EquipmentType.all
  end

  def update
    @equipment = Equipment.find(params[:id])

    @equipment.equipment_type_ids = params[:equipment_types]

    if @equipment.update(equipment_params)
      respond_to do |format|
        format.html { redirect_to edit_equipment_path(params[:id]), success: "Uspesno azurirana oprema." }
        format.json {
          msg = { :status => "OK", :equipment => @equipment }
          render :json => msg, status: :ok
        }
      end
    else
      respond_to do |format|
        format.html {
          @equipment.errors.full_messages.each do |message|
            flash[:danger] = message
          end
          render :new
        }
        format.json {
          msg = { :status => "ERR", :message => @equipment.errors.full_messages }
          render :json => msg, status: :unprocessable_entity
        }
      end
    end
  end

  def destroy
    @equipment = Equipment.find(params[:id])

    if ExerciseEquipment.where(equipment_id: @equipment.id).exists?
      respond_to do |format|
        format.html { redirect_to equipment_path, warning: 'Nije moguce obrisati opremu koja je trenutno u sklopu neke vezbe.' }
        format.json {
          msg = { :status => "ERR", :message => "Error" }
          render :json => msg, status: :unprocessable_entity
        }
      end
      return
    end

    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to equipment_path, success: 'Uspesno obrisana oprema.' }
      format.json {
        msg = { :status => "OK", :message => "Uspesno obrisana oprema." }
        render :json => msg, status: :ok
      }
    end
  end

  private
  def equipment_params
    params.require(:equipment).permit(:name)
  end
end
