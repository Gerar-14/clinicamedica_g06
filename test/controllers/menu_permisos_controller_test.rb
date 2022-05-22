require "test_helper"

class MenuPermisosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @menu_permiso = menu_permisos(:one)
  end

  test "should get index" do
    get menu_permisos_url
    assert_response :success
  end

  test "should get new" do
    get new_menu_permiso_url
    assert_response :success
  end

  test "should create menu_permiso" do
    assert_difference("MenuPermiso.count") do
      post menu_permisos_url, params: { menu_permiso: { menu_id: @menu_permiso.menu_id, permiso_id: @menu_permiso.permiso_id } }
    end

    assert_redirected_to menu_permiso_url(MenuPermiso.last)
  end

  test "should show menu_permiso" do
    get menu_permiso_url(@menu_permiso)
    assert_response :success
  end

  test "should get edit" do
    get edit_menu_permiso_url(@menu_permiso)
    assert_response :success
  end

  test "should update menu_permiso" do
    patch menu_permiso_url(@menu_permiso), params: { menu_permiso: { menu_id: @menu_permiso.menu_id, permiso_id: @menu_permiso.permiso_id } }
    assert_redirected_to menu_permiso_url(@menu_permiso)
  end

  test "should destroy menu_permiso" do
    assert_difference("MenuPermiso.count", -1) do
      delete menu_permiso_url(@menu_permiso)
    end

    assert_redirected_to menu_permisos_url
  end
end
