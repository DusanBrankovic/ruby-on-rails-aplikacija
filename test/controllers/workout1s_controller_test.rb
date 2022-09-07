require "test_helper"

class Workout1sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workout1 = workout1s(:one)
  end

  test "should get index" do
    get workout1s_url
    assert_response :success
  end

  test "should get new" do
    get new_workout1_url
    assert_response :success
  end

  test "should create workout1" do
    assert_difference('Workout1.count') do
      post workout1s_url, params: { workout1: { description: @workout1.description, name: @workout1.name } }
    end

    assert_redirected_to workout1_url(Workout1.last)
  end

  test "should show workout1" do
    get workout1_url(@workout1)
    assert_response :success
  end

  test "should get edit" do
    get edit_workout1_url(@workout1)
    assert_response :success
  end

  test "should update workout1" do
    patch workout1_url(@workout1), params: { workout1: { description: @workout1.description, name: @workout1.name } }
    assert_redirected_to workout1_url(@workout1)
  end

  test "should destroy workout1" do
    assert_difference('Workout1.count', -1) do
      delete workout1_url(@workout1)
    end

    assert_redirected_to workout1s_url
  end
end
