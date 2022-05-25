require "application_system_test_case"

class ValueReferencesTest < ApplicationSystemTestCase
  setup do
    @value_reference = value_references(:one)
  end

  test "visiting the index" do
    visit value_references_url
    assert_selector "h1", text: "Value references"
  end

  test "should create value reference" do
    visit value_references_url
    click_on "New value reference"

    fill_in "Parametro", with: @value_reference.parametro_id
    fill_in "Value reference", with: @value_reference.value_reference
    click_on "Create Value reference"

    assert_text "Value reference was successfully created"
    click_on "Back"
  end

  test "should update Value reference" do
    visit value_reference_url(@value_reference)
    click_on "Edit this value reference", match: :first

    fill_in "Parametro", with: @value_reference.parametro_id
    fill_in "Value reference", with: @value_reference.value_reference
    click_on "Update Value reference"

    assert_text "Value reference was successfully updated"
    click_on "Back"
  end

  test "should destroy Value reference" do
    visit value_reference_url(@value_reference)
    click_on "Destroy this value reference", match: :first

    assert_text "Value reference was successfully destroyed"
  end
end
