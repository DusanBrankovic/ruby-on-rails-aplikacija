require "application_system_test_case"

class EquipmentTypesTest < ApplicationSystemTestCase
  setup do
    @equipment_type = equipment_types(:one)
  end

  test "visiting the index" do
    visit equipment_types_url
    assert_selector "h1", text: "Equipment Types"
  end

  test "creating a Equipment type" do
    visit equipment_types_url
    click_on "New Equipment Type"

    click_on "Create Equipment type"

    assert_text "Equipment type was successfully created"
    click_on "Back"
  end

  test "updating a Equipment type" do
    visit equipment_types_url
    click_on "Edit", match: :first

    click_on "Update Equipment type"

    assert_text "Equipment type was successfully updated"
    click_on "Back"
  end

  test "destroying a Equipment type" do
    visit equipment_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Equipment type was successfully destroyed"
  end
end
