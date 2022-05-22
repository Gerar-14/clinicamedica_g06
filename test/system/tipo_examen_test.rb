require "application_system_test_case"

class TipoExamenTest < ApplicationSystemTestCase
  setup do
    @tipo_examan = tipo_examen(:one)
  end

  test "visiting the index" do
    visit tipo_examen_url
    assert_selector "h1", text: "Tipo examen"
  end

  test "should create tipo examen" do
    visit tipo_examen_url
    click_on "New tipo examen"

    fill_in "Nombre tipo examen", with: @tipo_examan.nombre_tipo_examen
    click_on "Create Tipo examen"

    assert_text "Tipo examen was successfully created"
    click_on "Back"
  end

  test "should update Tipo examen" do
    visit tipo_examan_url(@tipo_examan)
    click_on "Edit this tipo examen", match: :first

    fill_in "Nombre tipo examen", with: @tipo_examan.nombre_tipo_examen
    click_on "Update Tipo examen"

    assert_text "Tipo examen was successfully updated"
    click_on "Back"
  end

  test "should destroy Tipo examen" do
    visit tipo_examan_url(@tipo_examan)
    click_on "Destroy this tipo examen", match: :first

    assert_text "Tipo examen was successfully destroyed"
  end
end
