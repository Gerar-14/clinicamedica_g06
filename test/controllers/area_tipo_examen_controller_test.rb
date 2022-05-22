require "test_helper"

class AreaTipoExamenControllerTest < ActionDispatch::IntegrationTest
  setup do
    @area_tipo_examen = area_tipo_examen(:one)
  end

  test "should get index" do
    get area_tipo_examen_index_url
    assert_response :success
  end

  test "should get new" do
    get new_area_tipo_examen_url
    assert_response :success
  end

  test "should create area_tipo_examen" do
    assert_difference("AreaTipoExamen.count") do
      post area_tipo_examen_index_url, params: { area_tipo_examen: { area_id: @area_tipo_examen.area_id, tipo_examen_id: @area_tipo_examen.tipo_examen_id } }
    end

    assert_redirected_to area_tipo_examen_url(AreaTipoExamen.last)
  end

  test "should show area_tipo_examen" do
    get area_tipo_examen_url(@area_tipo_examen)
    assert_response :success
  end

  test "should get edit" do
    get edit_area_tipo_examen_url(@area_tipo_examen)
    assert_response :success
  end

  test "should update area_tipo_examen" do
    patch area_tipo_examen_url(@area_tipo_examen), params: { area_tipo_examen: { area_id: @area_tipo_examen.area_id, tipo_examen_id: @area_tipo_examen.tipo_examen_id } }
    assert_redirected_to area_tipo_examen_url(@area_tipo_examen)
  end

  test "should destroy area_tipo_examen" do
    assert_difference("AreaTipoExamen.count", -1) do
      delete area_tipo_examen_url(@area_tipo_examen)
    end

    assert_redirected_to area_tipo_examen_index_url
  end
end
