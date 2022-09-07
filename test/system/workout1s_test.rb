require "application_system_test_case"

class Workout1sTest < ApplicationSystemTestCase
  setup do
    @workout1 = workout1s(:one)
  end

  test "visiting the index" do
    visit workout1s_url
    assert_selector "h1", text: "Workout1s"
  end

  test "creating a Workout1" do
    visit workout1s_url
    click_on "New Workout1"

    fill_in "Description", with: @workout1.description
    fill_in "Name", with: @workout1.name
    click_on "Create Workout1"

    assert_text "Workout1 was successfully created"
    click_on "Back"
  end

  test "updating a Workout1" do
    visit workout1s_url
    click_on "Edit", match: :first

    fill_in "Description", with: @workout1.description
    fill_in "Name", with: @workout1.name
    click_on "Update Workout1"

    assert_text "Workout1 was successfully updated"
    click_on "Back"
  end

  test "destroying a Workout1" do
    visit workout1s_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Workout1 was successfully destroyed"
  end
end
