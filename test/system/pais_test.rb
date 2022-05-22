require "application_system_test_case"

class PaisTest < ApplicationSystemTestCase
  setup do
    @pais = pais(:one)
  end

  test "visiting the index" do
    visit pais_url
    assert_selector "h1", text: "Pais"
  end

  test "should create pais" do
    visit pais_url
    click_on "New pais"

    fill_in "Nombre pais", with: @pais.nombre_pais
    click_on "Create Pais"

    assert_text "Pais was successfully created"
    click_on "Back"
  end

  test "should update Pais" do
    visit pais_url(@pais)
    click_on "Edit this pais", match: :first

    fill_in "Nombre pais", with: @pais.nombre_pais
    click_on "Update Pais"

    assert_text "Pais was successfully updated"
    click_on "Back"
  end

  test "should destroy Pais" do
    visit pais_url(@pais)
    click_on "Destroy this pais", match: :first

    assert_text "Pais was successfully destroyed"
  end
end
