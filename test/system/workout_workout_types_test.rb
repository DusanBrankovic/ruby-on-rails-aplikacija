require "application_system_test_case"

class WorkoutWorkoutTypesTest < ApplicationSystemTestCase
  setup do
    @workout_workout_type = workout_workout_types(:one)
  end

  test "visiting the index" do
    visit workout_workout_types_url
    assert_selector "h1", text: "Workout Workout Types"
  end

  test "creating a Workout workout type" do
    visit workout_workout_types_url
    click_on "New Workout Workout Type"

    click_on "Create Workout workout type"

    assert_text "Workout workout type was successfully created"
    click_on "Back"
  end

  test "updating a Workout workout type" do
    visit workout_workout_types_url
    click_on "Edit", match: :first

    click_on "Update Workout workout type"

    assert_text "Workout workout type was successfully updated"
    click_on "Back"
  end

  test "destroying a Workout workout type" do
    visit workout_workout_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Workout workout type was successfully destroyed"
  end
end
