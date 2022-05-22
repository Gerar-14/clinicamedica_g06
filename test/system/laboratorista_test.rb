require "application_system_test_case"

class LaboratoristaTest < ApplicationSystemTestCase
  setup do
    @laboratoristum = laboratorista(:one)
  end

  test "visiting the index" do
    visit laboratorista_url
    assert_selector "h1", text: "Laboratorista"
  end

  test "should create laboratorista" do
    visit laboratorista_url
    click_on "New laboratorista"

    fill_in "Empleado", with: @laboratoristum.empleado_id
    fill_in "Laboratorio", with: @laboratoristum.laboratorio_id
    fill_in "Num junta vigilancia", with: @laboratoristum.num_junta_vigilancia
    click_on "Create Laboratorista"

    assert_text "Laboratorista was successfully created"
    click_on "Back"
  end

  test "should update Laboratorista" do
    visit laboratoristum_url(@laboratoristum)
    click_on "Edit this laboratorista", match: :first

    fill_in "Empleado", with: @laboratoristum.empleado_id
    fill_in "Laboratorio", with: @laboratoristum.laboratorio_id
    fill_in "Num junta vigilancia", with: @laboratoristum.num_junta_vigilancia
    click_on "Update Laboratorista"

    assert_text "Laboratorista was successfully updated"
    click_on "Back"
  end

  test "should destroy Laboratorista" do
    visit laboratoristum_url(@laboratoristum)
    click_on "Destroy this laboratorista", match: :first

    assert_text "Laboratorista was successfully destroyed"
  end
end
