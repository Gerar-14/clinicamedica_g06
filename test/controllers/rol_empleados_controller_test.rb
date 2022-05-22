require "test_helper"

class RolEmpleadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rol_empleado = rol_empleado(:one)
  end

  test "should get index" do
    get rol_empleados_url
    assert_response :success
  end

  test "should get new" do
    get new_rol_empleado_url
    assert_response :success
  end

  test "should create rol_empleado" do
    assert_difference("RolEmpleado.count") do
      post rol_empleados_url, params: { rol_empleado: { empleado_id: @rol_empleado.empleado_id, rol_id: @rol_empleado.rol_id } }
    end

    assert_redirected_to rol_empleado_url(RolEmpleado.last)
  end

  test "should show rol_empleado" do
    get rol_empleado_url(@rol_empleado)
    assert_response :success
  end

  test "should get edit" do
    get edit_rol_empleado_url(@rol_empleado)
    assert_response :success
  end

  test "should update rol_empleado" do
    patch rol_empleado_url(@rol_empleado), params: { rol_empleado: { empleado_id: @rol_empleado.empleado_id, rol_id: @rol_empleado.rol_id } }
    assert_redirected_to rol_empleado_url(@rol_empleado)
  end

  test "should destroy rol_empleado" do
    assert_difference("RolEmpleado.count", -1) do
      delete rol_empleado_url(@rol_empleado)
    end

    assert_redirected_to rol_empleados_url
  end
end
