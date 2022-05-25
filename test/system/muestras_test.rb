require "application_system_test_case"

class MuestrasTest < ApplicationSystemTestCase
  setup do
    @muestra = muestras(:one)
  end

  test "visiting the index" do
    visit muestras_url
    assert_selector "h1", text: "Muestras"
  end

  test "should create muestra" do
    visit muestras_url
    click_on "New muestra"

    fill_in "Empleado", with: @muestra.empleado_id
    fill_in "Fecha entrega muestra", with: @muestra.fecha_entrega_muestra
    fill_in "Orden", with: @muestra.orden_id
    fill_in "Tipo muestra", with: @muestra.tipo_muestra
    click_on "Create Muestra"

    assert_text "Muestra was successfully created"
    click_on "Back"
  end

  test "should update Muestra" do
    visit muestra_url(@muestra)
    click_on "Edit this muestra", match: :first

    fill_in "Empleado", with: @muestra.empleado_id
    fill_in "Fecha entrega muestra", with: @muestra.fecha_entrega_muestra
    fill_in "Orden", with: @muestra.orden_id
    fill_in "Tipo muestra", with: @muestra.tipo_muestra
    click_on "Update Muestra"

    assert_text "Muestra was successfully updated"
    click_on "Back"
  end

  test "should destroy Muestra" do
    visit muestra_url(@muestra)
    click_on "Destroy this muestra", match: :first

    assert_text "Muestra was successfully destroyed"
  end
end
