require "application_system_test_case"

class ValorReferenciaTest < ApplicationSystemTestCase
  setup do
    @valor_referencia = valor_referencia(:one)
  end

  test "visiting the index" do
    visit valor_referencia_url
    assert_selector "h1", text: "Valor referencia"
  end

  test "should create valor referencia" do
    visit valor_referencia_url
    click_on "New valor referencia"

    fill_in "Parametro", with: @valor_referencia.parametro_id
    fill_in "Valor referencia", with: @valor_referencia.valor_referencia
    click_on "Create Valor referencia"

    assert_text "Valor referencia was successfully created"
    click_on "Back"
  end

  test "should update Valor referencia" do
    visit valor_referencia_url(@valor_referencia)
    click_on "Edit this valor referencia", match: :first

    fill_in "Parametro", with: @valor_referencia.parametro_id
    fill_in "Valor referencia", with: @valor_referencia.valor_referencia
    click_on "Update Valor referencia"

    assert_text "Valor referencia was successfully updated"
    click_on "Back"
  end

  test "should destroy Valor referencia" do
    visit valor_referencia_url(@valor_referencia)
    click_on "Destroy this valor referencia", match: :first

    assert_text "Valor referencia was successfully destroyed"
  end
end
