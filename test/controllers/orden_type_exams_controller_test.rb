require "test_helper"

class OrdenTypeExamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orden_type_exam = orden_type_exams(:one)
  end

  test "should get index" do
    get orden_type_exams_url
    assert_response :success
  end

  test "should get new" do
    get new_orden_type_exam_url
    assert_response :success
  end

  test "should create orden_type_exam" do
    assert_difference("OrdenTypeExam.count") do
      post orden_type_exams_url, params: { orden_type_exam: { orden_id: @orden_type_exam.orden_id, type_exam_id: @orden_type_exam.type_exam_id } }
    end

    assert_redirected_to orden_type_exam_url(OrdenTypeExam.last)
  end

  test "should show orden_type_exam" do
    get orden_type_exam_url(@orden_type_exam)
    assert_response :success
  end

  test "should get edit" do
    get edit_orden_type_exam_url(@orden_type_exam)
    assert_response :success
  end

  test "should update orden_type_exam" do
    patch orden_type_exam_url(@orden_type_exam), params: { orden_type_exam: { orden_id: @orden_type_exam.orden_id, type_exam_id: @orden_type_exam.type_exam_id } }
    assert_redirected_to orden_type_exam_url(@orden_type_exam)
  end

  test "should destroy orden_type_exam" do
    assert_difference("OrdenTypeExam.count", -1) do
      delete orden_type_exam_url(@orden_type_exam)
    end

    assert_redirected_to orden_type_exams_url
  end
end
