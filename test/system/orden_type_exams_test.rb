require "application_system_test_case"

class OrdenTypeExamsTest < ApplicationSystemTestCase
  setup do
    @orden_type_exam = orden_type_exams(:one)
  end

  test "visiting the index" do
    visit orden_type_exams_url
    assert_selector "h1", text: "Orden type exams"
  end

  test "should create orden type exam" do
    visit orden_type_exams_url
    click_on "New orden type exam"

    fill_in "Orden", with: @orden_type_exam.orden_id
    fill_in "Type exam", with: @orden_type_exam.type_exam_id
    click_on "Create Orden type exam"

    assert_text "Orden type exam was successfully created"
    click_on "Back"
  end

  test "should update Orden type exam" do
    visit orden_type_exam_url(@orden_type_exam)
    click_on "Edit this orden type exam", match: :first

    fill_in "Orden", with: @orden_type_exam.orden_id
    fill_in "Type exam", with: @orden_type_exam.type_exam_id
    click_on "Update Orden type exam"

    assert_text "Orden type exam was successfully updated"
    click_on "Back"
  end

  test "should destroy Orden type exam" do
    visit orden_type_exam_url(@orden_type_exam)
    click_on "Destroy this orden type exam", match: :first

    assert_text "Orden type exam was successfully destroyed"
  end
end
