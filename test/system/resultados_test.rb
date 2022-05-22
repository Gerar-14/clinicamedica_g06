require "application_system_test_case"

class ResultadosTest < ApplicationSystemTestCase
  setup do
    @resultado = resultados(:one)
  end

  test "visiting the index" do
    visit resultados_url
    assert_selector "h1", text: "Resultados"
  end

  test "should create resultado" do
    visit resultados_url
    click_on "New resultado"

    fill_in "Descripcion", with: @resultado.descripcion
    fill_in "Orden", with: @resultado.orden_id
    fill_in "Parametro", with: @resultado.parametro_id
    click_on "Create Resultado"

    assert_text "Resultado was successfully created"
    click_on "Back"
  end

  test "should update Resultado" do
    visit resultado_url(@resultado)
    click_on "Edit this resultado", match: :first

    fill_in "Descripcion", with: @resultado.descripcion
    fill_in "Orden", with: @resultado.orden_id
    fill_in "Parametro", with: @resultado.parametro_id
    click_on "Update Resultado"

    assert_text "Resultado was successfully updated"
    click_on "Back"
  end

  test "should destroy Resultado" do
    visit resultado_url(@resultado)
    click_on "Destroy this resultado", match: :first

    assert_text "Resultado was successfully destroyed"
  end
end
