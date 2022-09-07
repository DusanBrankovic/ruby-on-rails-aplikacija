require "test_helper"

class ExerciseEquipmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exercise_equipment = exercise_equipments(:one)
  end

  test "should get index" do
    get exercise_equipments_url
    assert_response :success
  end

  test "should get new" do
    get new_exercise_equipment_url
    assert_response :success
  end

  test "should create exercise_equipment" do
    assert_difference('ExerciseEquipment.count') do
      post exercise_equipments_url, params: { exercise_equipment: {  } }
    end

    assert_redirected_to exercise_equipment_url(ExerciseEquipment.last)
  end

  test "should show exercise_equipment" do
    get exercise_equipment_url(@exercise_equipment)
    assert_response :success
  end

  test "should get edit" do
    get edit_exercise_equipment_url(@exercise_equipment)
    assert_response :success
  end

  test "should update exercise_equipment" do
    patch exercise_equipment_url(@exercise_equipment), params: { exercise_equipment: {  } }
    assert_redirected_to exercise_equipment_url(@exercise_equipment)
  end

  test "should destroy exercise_equipment" do
    assert_difference('ExerciseEquipment.count', -1) do
      delete exercise_equipment_url(@exercise_equipment)
    end

    assert_redirected_to exercise_equipments_url
  end
end
