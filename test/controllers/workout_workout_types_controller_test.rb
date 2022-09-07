require "test_helper"

class WorkoutWorkoutTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workout_workout_type = workout_workout_types(:one)
  end

  test "should get index" do
    get workout_workout_types_url
    assert_response :success
  end

  test "should get new" do
    get new_workout_workout_type_url
    assert_response :success
  end

  test "should create workout_workout_type" do
    assert_difference('WorkoutWorkoutType.count') do
      post workout_workout_types_url, params: { workout_workout_type: {  } }
    end

    assert_redirected_to workout_workout_type_url(WorkoutWorkoutType.last)
  end

  test "should show workout_workout_type" do
    get workout_workout_type_url(@workout_workout_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_workout_workout_type_url(@workout_workout_type)
    assert_response :success
  end

  test "should update workout_workout_type" do
    patch workout_workout_type_url(@workout_workout_type), params: { workout_workout_type: {  } }
    assert_redirected_to workout_workout_type_url(@workout_workout_type)
  end

  test "should destroy workout_workout_type" do
    assert_difference('WorkoutWorkoutType.count', -1) do
      delete workout_workout_type_url(@workout_workout_type)
    end

    assert_redirected_to workout_workout_types_url
  end
end
