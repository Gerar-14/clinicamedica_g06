require "test_helper"

class TypeExamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_exam = type_exams(:one)
  end

  test "should get index" do
    get type_exams_url
    assert_response :success
  end

  test "should get new" do
    get new_type_exam_url
    assert_response :success
  end

  test "should create type_exam" do
    assert_difference("TypeExam.count") do
      post type_exams_url, params: { type_exam: { name_type_examn: @type_exam.name_type_examn } }
    end

    assert_redirected_to type_exam_url(TypeExam.last)
  end

  test "should show type_exam" do
    get type_exam_url(@type_exam)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_exam_url(@type_exam)
    assert_response :success
  end

  test "should update type_exam" do
    patch type_exam_url(@type_exam), params: { type_exam: { name_type_examn: @type_exam.name_type_examn } }
    assert_redirected_to type_exam_url(@type_exam)
  end

  test "should destroy type_exam" do
    assert_difference("TypeExam.count", -1) do
      delete type_exam_url(@type_exam)
    end

    assert_redirected_to type_exams_url
  end
end
