require "application_system_test_case"

class TypeExamsTest < ApplicationSystemTestCase
  setup do
    @type_exam = type_exams(:one)
  end

  test "visiting the index" do
    visit type_exams_url
    assert_selector "h1", text: "Type exams"
  end

  test "should create type exam" do
    visit type_exams_url
    click_on "New type exam"

    fill_in "Name type examn", with: @type_exam.name_type_examn
    click_on "Create Type exam"

    assert_text "Type exam was successfully created"
    click_on "Back"
  end

  test "should update Type exam" do
    visit type_exam_url(@type_exam)
    click_on "Edit this type exam", match: :first

    fill_in "Name type examn", with: @type_exam.name_type_examn
    click_on "Update Type exam"

    assert_text "Type exam was successfully updated"
    click_on "Back"
  end

  test "should destroy Type exam" do
    visit type_exam_url(@type_exam)
    click_on "Destroy this type exam", match: :first

    assert_text "Type exam was successfully destroyed"
  end
end
