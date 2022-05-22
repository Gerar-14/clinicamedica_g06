require "application_system_test_case"

class PermisosTest < ApplicationSystemTestCase
  setup do
    @permiso = permiso(:one)
  end

  test "visiting the index" do
    visit permisos_url
    assert_selector "h1", text: "Permisos"
  end

  test "should create permiso" do
    visit permisos_url
    click_on "New permiso"

    fill_in "Nombre permiso", with: @permiso.nombre_permiso
    click_on "Create Permiso"

    assert_text "Permiso was successfully created"
    click_on "Back"
  end

  test "should update Permiso" do
    visit permiso_url(@permiso)
    click_on "Edit this permiso", match: :first

    fill_in "Nombre permiso", with: @permiso.nombre_permiso
    click_on "Update Permiso"

    assert_text "Permiso was successfully updated"
    click_on "Back"
  end

  test "should destroy Permiso" do
    visit permiso_url(@permiso)
    click_on "Destroy this permiso", match: :first

    assert_text "Permiso was successfully destroyed"
  end
end
