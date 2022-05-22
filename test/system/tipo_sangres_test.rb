require "application_system_test_case"

class TipoSangresTest < ApplicationSystemTestCase
  setup do
    @tipo_sangre = tipo_sangre(:one)
  end

  test "visiting the index" do
    visit tipo_sangres_url
    assert_selector "h1", text: "Tipo sangres"
  end

  test "should create tipo sangre" do
    visit tipo_sangres_url
    click_on "New tipo sangre"

    fill_in "Nombre tipo sangre", with: @tipo_sangre.nombre_tipo_sangre
    click_on "Create Tipo sangre"

    assert_text "Tipo sangre was successfully created"
    click_on "Back"
  end

  test "should update Tipo sangre" do
    visit tipo_sangre_url(@tipo_sangre)
    click_on "Edit this tipo sangre", match: :first

    fill_in "Nombre tipo sangre", with: @tipo_sangre.nombre_tipo_sangre
    click_on "Update Tipo sangre"

    assert_text "Tipo sangre was successfully updated"
    click_on "Back"
  end

  test "should destroy Tipo sangre" do
    visit tipo_sangre_url(@tipo_sangre)
    click_on "Destroy this tipo sangre", match: :first

    assert_text "Tipo sangre was successfully destroyed"
  end
end
