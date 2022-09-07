require "test_helper"

class EquipmentEquipmentTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equipment_equipment_type = equipment_equipment_types(:one)
  end

  test "should get index" do
    get equipment_equipment_types_url
    assert_response :success
  end

  test "should get new" do
    get new_equipment_equipment_type_url
    assert_response :success
  end

  test "should create equipment_equipment_type" do
    assert_difference('EquipmentEquipmentType.count') do
      post equipment_equipment_types_url, params: { equipment_equipment_type: {  } }
    end

    assert_redirected_to equipment_equipment_type_url(EquipmentEquipmentType.last)
  end

  test "should show equipment_equipment_type" do
    get equipment_equipment_type_url(@equipment_equipment_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_equipment_equipment_type_url(@equipment_equipment_type)
    assert_response :success
  end

  test "should update equipment_equipment_type" do
    patch equipment_equipment_type_url(@equipment_equipment_type), params: { equipment_equipment_type: {  } }
    assert_redirected_to equipment_equipment_type_url(@equipment_equipment_type)
  end

  test "should destroy equipment_equipment_type" do
    assert_difference('EquipmentEquipmentType.count', -1) do
      delete equipment_equipment_type_url(@equipment_equipment_type)
    end

    assert_redirected_to equipment_equipment_types_url
  end
end
