require "test_helper"

class AccesosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @acceso = accesos(:one)
  end

  test "should get index" do
    get accesos_url
    assert_response :success
  end

  test "should get new" do
    get new_acceso_url
    assert_response :success
  end

  test "should create acceso" do
    assert_difference("Acceso.count") do
      post accesos_url, params: { acceso: { permiso_id: @acceso.permiso_id, rol_id: @acceso.rol_id } }
    end

    assert_redirected_to acceso_url(Acceso.last)
  end

  test "should show acceso" do
    get acceso_url(@acceso)
    assert_response :success
  end

  test "should get edit" do
    get edit_acceso_url(@acceso)
    assert_response :success
  end

  test "should update acceso" do
    patch acceso_url(@acceso), params: { acceso: { permiso_id: @acceso.permiso_id, rol_id: @acceso.rol_id } }
    assert_redirected_to acceso_url(@acceso)
  end

  test "should destroy acceso" do
    assert_difference("Acceso.count", -1) do
      delete acceso_url(@acceso)
    end

    assert_redirected_to accesos_url
  end
end
