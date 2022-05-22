require "application_system_test_case"

class UnidadMedidasTest < ApplicationSystemTestCase
  setup do
    @unidad_medida = unidad_medidas(:one)
  end

  test "visiting the index" do
    visit unidad_medidas_url
    assert_selector "h1", text: "Unidad medidas"
  end

  test "should create unidad medida" do
    visit unidad_medidas_url
    click_on "New unidad medida"

    fill_in "Descripcion unidad medida", with: @unidad_medida.descripcion_unidad_medida
    fill_in "Nombre unidad medida", with: @unidad_medida.nombre_unidad_medida
    fill_in "Siglas", with: @unidad_medida.siglas
    fill_in "Sistema medida", with: @unidad_medida.sistema_medida
    click_on "Create Unidad medida"

    assert_text "Unidad medida was successfully created"
    click_on "Back"
  end

  test "should update Unidad medida" do
    visit unidad_medida_url(@unidad_medida)
    click_on "Edit this unidad medida", match: :first

    fill_in "Descripcion unidad medida", with: @unidad_medida.descripcion_unidad_medida
    fill_in "Nombre unidad medida", with: @unidad_medida.nombre_unidad_medida
    fill_in "Siglas", with: @unidad_medida.siglas
    fill_in "Sistema medida", with: @unidad_medida.sistema_medida
    click_on "Update Unidad medida"

    assert_text "Unidad medida was successfully updated"
    click_on "Back"
  end

  test "should destroy Unidad medida" do
    visit unidad_medida_url(@unidad_medida)
    click_on "Destroy this unidad medida", match: :first

    assert_text "Unidad medida was successfully destroyed"
  end
end
