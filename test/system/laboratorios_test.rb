require "application_system_test_case"

class LaboratoriosTest < ApplicationSystemTestCase
  setup do
    @laboratorio = laboratorios(:one)
  end

  test "visiting the index" do
    visit laboratorios_url
    assert_selector "h1", text: "Laboratorios"
  end

  test "should create laboratorio" do
    visit laboratorios_url
    click_on "New laboratorio"

    fill_in "Municipio", with: @laboratorio.municipio_id
    fill_in "Nombre laboratorio", with: @laboratorio.nombre_laboratorio
    click_on "Create Laboratorio"

    assert_text "Laboratorio was successfully created"
    click_on "Back"
  end

  test "should update Laboratorio" do
    visit laboratorio_url(@laboratorio)
    click_on "Edit this laboratorio", match: :first

    fill_in "Municipio", with: @laboratorio.municipio_id
    fill_in "Nombre laboratorio", with: @laboratorio.nombre_laboratorio
    click_on "Update Laboratorio"

    assert_text "Laboratorio was successfully updated"
    click_on "Back"
  end

  test "should destroy Laboratorio" do
    visit laboratorio_url(@laboratorio)
    click_on "Destroy this laboratorio", match: :first

    assert_text "Laboratorio was successfully destroyed"
  end
end
