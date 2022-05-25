require "test_helper"

class TypeExamParametrosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_exam_parametro = type_exam_parametros(:one)
  end

  test "should get index" do
    get type_exam_parametros_url
    assert_response :success
  end

  test "should get new" do
    get new_type_exam_parametro_url
    assert_response :success
  end

  test "should create type_exam_parametro" do
    assert_difference("TypeExamParametro.count") do
      post type_exam_parametros_url, params: { type_exam_parametro: { parametro_id: @type_exam_parametro.parametro_id, type_exam_id: @type_exam_parametro.type_exam_id } }
    end

    assert_redirected_to type_exam_parametro_url(TypeExamParametro.last)
  end

  test "should show type_exam_parametro" do
    get type_exam_parametro_url(@type_exam_parametro)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_exam_parametro_url(@type_exam_parametro)
    assert_response :success
  end

  test "should update type_exam_parametro" do
    patch type_exam_parametro_url(@type_exam_parametro), params: { type_exam_parametro: { parametro_id: @type_exam_parametro.parametro_id, type_exam_id: @type_exam_parametro.type_exam_id } }
    assert_redirected_to type_exam_parametro_url(@type_exam_parametro)
  end

  test "should destroy type_exam_parametro" do
    assert_difference("TypeExamParametro.count", -1) do
      delete type_exam_parametro_url(@type_exam_parametro)
    end

    assert_redirected_to type_exam_parametros_url
  end
end
