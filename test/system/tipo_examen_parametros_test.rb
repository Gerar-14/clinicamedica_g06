require "application_system_test_case"

class TipoExamenParametrosTest < ApplicationSystemTestCase
  setup do
    @tipo_examen_parametro = tipo_examen_parametro(:one)
  end

  test "visiting the index" do
    visit tipo_examen_parametros_url
    assert_selector "h1", text: "Tipo examen parametros"
  end

  test "should create tipo examen parametro" do
    visit tipo_examen_parametros_url
    click_on "New tipo examen parametro"

    fill_in "Parametro", with: @tipo_examen_parametro.parametro_id
    fill_in "Tipo examen", with: @tipo_examen_parametro.tipo_examen_id
    click_on "Create Tipo examen parametro"

    assert_text "Tipo examen parametro was successfully created"
    click_on "Back"
  end

  test "should update Tipo examen parametro" do
    visit tipo_examen_parametro_url(@tipo_examen_parametro)
    click_on "Edit this tipo examen parametro", match: :first

    fill_in "Parametro", with: @tipo_examen_parametro.parametro_id
    fill_in "Tipo examen", with: @tipo_examen_parametro.tipo_examen_id
    click_on "Update Tipo examen parametro"

    assert_text "Tipo examen parametro was successfully updated"
    click_on "Back"
  end

  test "should destroy Tipo examen parametro" do
    visit tipo_examen_parametro_url(@tipo_examen_parametro)
    click_on "Destroy this tipo examen parametro", match: :first

    assert_text "Tipo examen parametro was successfully destroyed"
  end
end
