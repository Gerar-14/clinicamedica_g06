require "application_system_test_case"

class LaboratoristaTest < ApplicationSystemTestCase
  setup do
    @laboratorista = laboratorista(:one)
  end

  test "visiting the index" do
    visit laboratorista_url
    assert_selector "h1", text: "Laboratorista"
  end

  test "should create laboratorista" do
    visit laboratorista_url
    click_on "New laboratorista"

    fill_in "Empleado", with: @laboratorista.empleado_id
    fill_in "Laboratorio", with: @laboratorista.laboratorio_id
    fill_in "Num junta vigilancia", with: @laboratorista.num_junta_vigilancia
    click_on "Create Laboratorista"

    assert_text "Laboratorista was successfully created"
    click_on "Back"
  end

  test "should update Laboratorista" do
    visit laboratorista_url(@laboratorista)
    click_on "Edit this laboratorista", match: :first

    fill_in "Empleado", with: @laboratorista.empleado_id
    fill_in "Laboratorio", with: @laboratorista.laboratorio_id
    fill_in "Num junta vigilancia", with: @laboratorista.num_junta_vigilancia
    click_on "Update Laboratorista"

    assert_text "Laboratorista was successfully updated"
    click_on "Back"
  end

  test "should destroy Laboratorista" do
    visit laboratorista_url(@laboratorista)
    click_on "Destroy this laboratorista", match: :first

    assert_text "Laboratorista was successfully destroyed"
  end
end
