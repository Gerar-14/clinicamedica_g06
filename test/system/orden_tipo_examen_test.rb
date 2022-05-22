require "application_system_test_case"

class OrdenTipoExamenTest < ApplicationSystemTestCase
  setup do
    @orden_tipo_examan = orden_tipo_examen(:one)
  end

  test "visiting the index" do
    visit orden_tipo_examen_url
    assert_selector "h1", text: "Orden tipo examen"
  end

  test "should create orden tipo examen" do
    visit orden_tipo_examen_url
    click_on "New orden tipo examen"

    fill_in "Orden", with: @orden_tipo_examan.orden_id
    fill_in "Tipo examen", with: @orden_tipo_examan.tipo_examen_id
    click_on "Create Orden tipo examen"

    assert_text "Orden tipo examen was successfully created"
    click_on "Back"
  end

  test "should update Orden tipo examen" do
    visit orden_tipo_examan_url(@orden_tipo_examan)
    click_on "Edit this orden tipo examen", match: :first

    fill_in "Orden", with: @orden_tipo_examan.orden_id
    fill_in "Tipo examen", with: @orden_tipo_examan.tipo_examen_id
    click_on "Update Orden tipo examen"

    assert_text "Orden tipo examen was successfully updated"
    click_on "Back"
  end

  test "should destroy Orden tipo examen" do
    visit orden_tipo_examan_url(@orden_tipo_examan)
    click_on "Destroy this orden tipo examen", match: :first

    assert_text "Orden tipo examen was successfully destroyed"
  end
end
