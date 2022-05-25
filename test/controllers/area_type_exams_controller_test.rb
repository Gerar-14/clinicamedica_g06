require "test_helper"

class AreaTypeExamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @area_type_exam = area_type_exams(:one)
  end

  test "should get index" do
    get area_type_exams_url
    assert_response :success
  end

  test "should get new" do
    get new_area_type_exam_url
    assert_response :success
  end

  test "should create area_type_exam" do
    assert_difference("AreaTypeExam.count") do
      post area_type_exams_url, params: { area_type_exam: { area_id: @area_type_exam.area_id, type_exam_id: @area_type_exam.type_exam_id } }
    end

    assert_redirected_to area_type_exam_url(AreaTypeExam.last)
  end

  test "should show area_type_exam" do
    get area_type_exam_url(@area_type_exam)
    assert_response :success
  end

  test "should get edit" do
    get edit_area_type_exam_url(@area_type_exam)
    assert_response :success
  end

  test "should update area_type_exam" do
    patch area_type_exam_url(@area_type_exam), params: { area_type_exam: { area_id: @area_type_exam.area_id, type_exam_id: @area_type_exam.type_exam_id } }
    assert_redirected_to area_type_exam_url(@area_type_exam)
  end

  test "should destroy area_type_exam" do
    assert_difference("AreaTypeExam.count", -1) do
      delete area_type_exam_url(@area_type_exam)
    end

    assert_redirected_to area_type_exams_url
  end
end
