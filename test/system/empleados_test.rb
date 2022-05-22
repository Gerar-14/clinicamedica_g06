require "application_system_test_case"

class EmpleadosTest < ApplicationSystemTestCase
  setup do
    @empleado = empleados(:one)
  end

  test "visiting the index" do
    visit empleados_url
    assert_selector "h1", text: "Empleados"
  end

  test "should create empleado" do
    visit empleados_url
    click_on "New empleado"

    fill_in "Apellido empleado", with: @empleado.apellido_empleado
    fill_in "Dui empleado", with: @empleado.dui_empleado
    fill_in "Municipio", with: @empleado.municipio_id
    fill_in "Nombre empleado", with: @empleado.nombre_empleado
    fill_in "Profesion", with: @empleado.profesion
    fill_in "Users", with: @empleado.users_id
    click_on "Create Empleado"

    assert_text "Empleado was successfully created"
    click_on "Back"
  end

  test "should update Empleado" do
    visit empleado_url(@empleado)
    click_on "Edit this empleado", match: :first

    fill_in "Apellido empleado", with: @empleado.apellido_empleado
    fill_in "Dui empleado", with: @empleado.dui_empleado
    fill_in "Municipio", with: @empleado.municipio_id
    fill_in "Nombre empleado", with: @empleado.nombre_empleado
    fill_in "Profesion", with: @empleado.profesion
    fill_in "Users", with: @empleado.users_id
    click_on "Update Empleado"

    assert_text "Empleado was successfully updated"
    click_on "Back"
  end

  test "should destroy Empleado" do
    visit empleado_url(@empleado)
    click_on "Destroy this empleado", match: :first

    assert_text "Empleado was successfully destroyed"
  end
end
