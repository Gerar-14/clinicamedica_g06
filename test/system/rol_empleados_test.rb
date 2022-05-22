require "application_system_test_case"

class RolEmpleadosTest < ApplicationSystemTestCase
  setup do
    @rol_empleado = rol_empleados(:one)
  end

  test "visiting the index" do
    visit rol_empleados_url
    assert_selector "h1", text: "Rol empleados"
  end

  test "should create rol empleado" do
    visit rol_empleados_url
    click_on "New rol empleado"

    fill_in "Empleado", with: @rol_empleado.empleado_id
    fill_in "Rol", with: @rol_empleado.rol_id
    click_on "Create Rol empleado"

    assert_text "Rol empleado was successfully created"
    click_on "Back"
  end

  test "should update Rol empleado" do
    visit rol_empleado_url(@rol_empleado)
    click_on "Edit this rol empleado", match: :first

    fill_in "Empleado", with: @rol_empleado.empleado_id
    fill_in "Rol", with: @rol_empleado.rol_id
    click_on "Update Rol empleado"

    assert_text "Rol empleado was successfully updated"
    click_on "Back"
  end

  test "should destroy Rol empleado" do
    visit rol_empleado_url(@rol_empleado)
    click_on "Destroy this rol empleado", match: :first

    assert_text "Rol empleado was successfully destroyed"
  end
end
