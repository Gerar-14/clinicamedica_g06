require "application_system_test_case"

class AreaTipoExamenTest < ApplicationSystemTestCase
  setup do
    @area_tipo_examan = area_tipo_examen(:one)
  end

  test "visiting the index" do
    visit area_tipo_examen_url
    assert_selector "h1", text: "Area tipo examen"
  end

  test "should create area tipo examen" do
    visit area_tipo_examen_url
    click_on "New area tipo examen"

    fill_in "Area", with: @area_tipo_examan.area_id
    fill_in "Tipo examen", with: @area_tipo_examan.tipo_examen_id
    click_on "Create Area tipo examen"

    assert_text "Area tipo examen was successfully created"
    click_on "Back"
  end

  test "should update Area tipo examen" do
    visit area_tipo_examan_url(@area_tipo_examan)
    click_on "Edit this area tipo examen", match: :first

    fill_in "Area", with: @area_tipo_examan.area_id
    fill_in "Tipo examen", with: @area_tipo_examan.tipo_examen_id
    click_on "Update Area tipo examen"

    assert_text "Area tipo examen was successfully updated"
    click_on "Back"
  end

  test "should destroy Area tipo examen" do
    visit area_tipo_examan_url(@area_tipo_examan)
    click_on "Destroy this area tipo examen", match: :first

    assert_text "Area tipo examen was successfully destroyed"
  end
end
