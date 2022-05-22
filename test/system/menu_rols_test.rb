require "application_system_test_case"

class MenuRolsTest < ApplicationSystemTestCase
  setup do
    @menu_rol = menu_rols(:one)
  end

  test "visiting the index" do
    visit menu_rols_url
    assert_selector "h1", text: "Menu rols"
  end

  test "should create menu rol" do
    visit menu_rols_url
    click_on "New menu rol"

    fill_in "Menu", with: @menu_rol.menu_id
    fill_in "Rol", with: @menu_rol.rol_id
    click_on "Create Menu rol"

    assert_text "Menu rol was successfully created"
    click_on "Back"
  end

  test "should update Menu rol" do
    visit menu_rol_url(@menu_rol)
    click_on "Edit this menu rol", match: :first

    fill_in "Menu", with: @menu_rol.menu_id
    fill_in "Rol", with: @menu_rol.rol_id
    click_on "Update Menu rol"

    assert_text "Menu rol was successfully updated"
    click_on "Back"
  end

  test "should destroy Menu rol" do
    visit menu_rol_url(@menu_rol)
    click_on "Destroy this menu rol", match: :first

    assert_text "Menu rol was successfully destroyed"
  end
end
