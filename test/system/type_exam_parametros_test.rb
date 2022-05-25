require "application_system_test_case"

class TypeExamParametrosTest < ApplicationSystemTestCase
  setup do
    @type_exam_parametro = type_exam_parametros(:one)
  end

  test "visiting the index" do
    visit type_exam_parametros_url
    assert_selector "h1", text: "Type exam parametros"
  end

  test "should create type exam parametro" do
    visit type_exam_parametros_url
    click_on "New type exam parametro"

    fill_in "Parametro", with: @type_exam_parametro.parametro_id
    fill_in "Type exam", with: @type_exam_parametro.type_exam_id
    click_on "Create Type exam parametro"

    assert_text "Type exam parametro was successfully created"
    click_on "Back"
  end

  test "should update Type exam parametro" do
    visit type_exam_parametro_url(@type_exam_parametro)
    click_on "Edit this type exam parametro", match: :first

    fill_in "Parametro", with: @type_exam_parametro.parametro_id
    fill_in "Type exam", with: @type_exam_parametro.type_exam_id
    click_on "Update Type exam parametro"

    assert_text "Type exam parametro was successfully updated"
    click_on "Back"
  end

  test "should destroy Type exam parametro" do
    visit type_exam_parametro_url(@type_exam_parametro)
    click_on "Destroy this type exam parametro", match: :first

    assert_text "Type exam parametro was successfully destroyed"
  end
end
