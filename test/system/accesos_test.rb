require "application_system_test_case"

class AccesosTest < ApplicationSystemTestCase
  setup do
    @acceso = acceso(:one)
  end

  test "visiting the index" do
    visit accesos_url
    assert_selector "h1", text: "Accesos"
  end

  test "should create acceso" do
    visit accesos_url
    click_on "New acceso"

    fill_in "Permiso", with: @acceso.permiso_id
    fill_in "Rol", with: @acceso.rol_id
    click_on "Create Acceso"

    assert_text "Acceso was successfully created"
    click_on "Back"
  end

  test "should update Acceso" do
    visit acceso_url(@acceso)
    click_on "Edit this acceso", match: :first

    fill_in "Permiso", with: @acceso.permiso_id
    fill_in "Rol", with: @acceso.rol_id
    click_on "Update Acceso"

    assert_text "Acceso was successfully updated"
    click_on "Back"
  end

  test "should destroy Acceso" do
    visit acceso_url(@acceso)
    click_on "Destroy this acceso", match: :first

    assert_text "Acceso was successfully destroyed"
  end
end
