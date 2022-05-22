require "application_system_test_case"

class CaracolsTest < ApplicationSystemTestCase
  setup do
    @caracol = caracols(:one)
  end

  test "visiting the index" do
    visit caracols_url
    assert_selector "h1", text: "Caracols"
  end

  test "should create caracol" do
    visit caracols_url
    click_on "New caracol"

    fill_in "Nombre", with: @caracol.nombre
    click_on "Create Caracol"

    assert_text "Caracol was successfully created"
    click_on "Back"
  end

  test "should update Caracol" do
    visit caracol_url(@caracol)
    click_on "Edit this caracol", match: :first

    fill_in "Nombre", with: @caracol.nombre
    click_on "Update Caracol"

    assert_text "Caracol was successfully updated"
    click_on "Back"
  end

  test "should destroy Caracol" do
    visit caracol_url(@caracol)
    click_on "Destroy this caracol", match: :first

    assert_text "Caracol was successfully destroyed"
  end
end
