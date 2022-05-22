require "application_system_test_case"

class MenuPermisosTest < ApplicationSystemTestCase
  setup do
    @menu_permiso = menu_permiso(:one)
  end

  test "visiting the index" do
    visit menu_permisos_url
    assert_selector "h1", text: "Menu permisos"
  end

  test "should create menu permiso" do
    visit menu_permisos_url
    click_on "New menu permiso"

    fill_in "Menu", with: @menu_permiso.menu_id
    fill_in "Permiso", with: @menu_permiso.permiso_id
    click_on "Create Menu permiso"

    assert_text "Menu permiso was successfully created"
    click_on "Back"
  end

  test "should update Menu permiso" do
    visit menu_permiso_url(@menu_permiso)
    click_on "Edit this menu permiso", match: :first

    fill_in "Menu", with: @menu_permiso.menu_id
    fill_in "Permiso", with: @menu_permiso.permiso_id
    click_on "Update Menu permiso"

    assert_text "Menu permiso was successfully updated"
    click_on "Back"
  end

  test "should destroy Menu permiso" do
    visit menu_permiso_url(@menu_permiso)
    click_on "Destroy this menu permiso", match: :first

    assert_text "Menu permiso was successfully destroyed"
  end
end
