require "application_system_test_case"

class EquipmentEquipmentTypesTest < ApplicationSystemTestCase
  setup do
    @equipment_equipment_type = equipment_equipment_types(:one)
  end

  test "visiting the index" do
    visit equipment_equipment_types_url
    assert_selector "h1", text: "Equipment Equipment Types"
  end

  test "creating a Equipment equipment type" do
    visit equipment_equipment_types_url
    click_on "New Equipment Equipment Type"

    click_on "Create Equipment equipment type"

    assert_text "Equipment equipment type was successfully created"
    click_on "Back"
  end

  test "updating a Equipment equipment type" do
    visit equipment_equipment_types_url
    click_on "Edit", match: :first

    click_on "Update Equipment equipment type"

    assert_text "Equipment equipment type was successfully updated"
    click_on "Back"
  end

  test "destroying a Equipment equipment type" do
    visit equipment_equipment_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Equipment equipment type was successfully destroyed"
  end
end
