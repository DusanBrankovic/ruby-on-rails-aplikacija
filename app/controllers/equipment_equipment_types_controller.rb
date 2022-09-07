class EquipmentEquipmentTypesController < ApplicationController
  before_action :set_equipment_equipment_type, only: [:show, :edit, :update, :destroy]

  # GET /equipment_equipment_types
  # GET /equipment_equipment_types.json
  def index
    @equipment_equipment_types = EquipmentEquipmentType.all
  end

  # GET /equipment_equipment_types/1
  # GET /equipment_equipment_types/1.json
  def show
  end

  # GET /equipment_equipment_types/new
  def new
    @equipment_equipment_type = EquipmentEquipmentType.new
  end

  # GET /equipment_equipment_types/1/edit
  def edit
  end

  # POST /equipment_equipment_types
  # POST /equipment_equipment_types.json
  def create
    @equipment_equipment_type = EquipmentEquipmentType.new(equipment_equipment_type_params)

    respond_to do |format|
      if @equipment_equipment_type.save
        format.html { redirect_to @equipment_equipment_type, notice: 'Equipment equipment type was successfully created.' }
        format.json { render :show, status: :created, location: @equipment_equipment_type }
      else
        format.html { render :new }
        format.json { render json: @equipment_equipment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipment_equipment_types/1
  # PATCH/PUT /equipment_equipment_types/1.json
  def update
    respond_to do |format|
      if @equipment_equipment_type.update(equipment_equipment_type_params)
        format.html { redirect_to @equipment_equipment_type, notice: 'Equipment equipment type was successfully updated.' }
        format.json { render :show, status: :ok, location: @equipment_equipment_type }
      else
        format.html { render :edit }
        format.json { render json: @equipment_equipment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment_equipment_types/1
  # DELETE /equipment_equipment_types/1.json
  def destroy
    @equipment_equipment_type.destroy
    respond_to do |format|
      format.html { redirect_to equipment_equipment_types_url, notice: 'Equipment equipment type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment_equipment_type
      @equipment_equipment_type = EquipmentEquipmentType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def equipment_equipment_type_params
      params.fetch(:equipment_equipment_type, {})
    end
end
