require "application_system_test_case"

class ExerciseEquipmentsTest < ApplicationSystemTestCase
  setup do
    @exercise_equipment = exercise_equipments(:one)
  end

  test "visiting the index" do
    visit exercise_equipments_url
    assert_selector "h1", text: "Exercise Equipments"
  end

  test "creating a Exercise equipment" do
    visit exercise_equipments_url
    click_on "New Exercise Equipment"

    click_on "Create Exercise equipment"

    assert_text "Exercise equipment was successfully created"
    click_on "Back"
  end

  test "updating a Exercise equipment" do
    visit exercise_equipments_url
    click_on "Edit", match: :first

    click_on "Update Exercise equipment"

    assert_text "Exercise equipment was successfully updated"
    click_on "Back"
  end

  test "destroying a Exercise equipment" do
    visit exercise_equipments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exercise equipment was successfully destroyed"
  end
end
