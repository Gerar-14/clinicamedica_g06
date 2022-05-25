require "application_system_test_case"

class AreaTypeExamsTest < ApplicationSystemTestCase
  setup do
    @area_type_exam = area_type_exams(:one)
  end

  test "visiting the index" do
    visit area_type_exams_url
    assert_selector "h1", text: "Area type exams"
  end

  test "should create area type exam" do
    visit area_type_exams_url
    click_on "New area type exam"

    fill_in "Area", with: @area_type_exam.area_id
    fill_in "Type exam", with: @area_type_exam.type_exam_id
    click_on "Create Area type exam"

    assert_text "Area type exam was successfully created"
    click_on "Back"
  end

  test "should update Area type exam" do
    visit area_type_exam_url(@area_type_exam)
    click_on "Edit this area type exam", match: :first

    fill_in "Area", with: @area_type_exam.area_id
    fill_in "Type exam", with: @area_type_exam.type_exam_id
    click_on "Update Area type exam"

    assert_text "Area type exam was successfully updated"
    click_on "Back"
  end

  test "should destroy Area type exam" do
    visit area_type_exam_url(@area_type_exam)
    click_on "Destroy this area type exam", match: :first

    assert_text "Area type exam was successfully destroyed"
  end
end
