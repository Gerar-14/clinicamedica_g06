require "test_helper"

class AreaTipoExamenControllerTest < ActionDispatch::IntegrationTest
  setup do
    @area_tipo_examan = area_tipo_examen(:one)
  end

  test "should get index" do
    get area_tipo_examen_index_url
    assert_response :success
  end

  test "should get new" do
    get new_area_tipo_examan_url
    assert_response :success
  end

  test "should create area_tipo_examan" do
    assert_difference("AreaTipoExamen.count") do
      post area_tipo_examen_index_url, params: { area_tipo_examan: { area_id: @area_tipo_examan.area_id, tipo_examen_id: @area_tipo_examan.tipo_examen_id } }
    end

    assert_redirected_to area_tipo_examan_url(AreaTipoExamen.last)
  end

  test "should show area_tipo_examan" do
    get area_tipo_examan_url(@area_tipo_examan)
    assert_response :success
  end

  test "should get edit" do
    get edit_area_tipo_examan_url(@area_tipo_examan)
    assert_response :success
  end

  test "should update area_tipo_examan" do
    patch area_tipo_examan_url(@area_tipo_examan), params: { area_tipo_examan: { area_id: @area_tipo_examan.area_id, tipo_examen_id: @area_tipo_examan.tipo_examen_id } }
    assert_redirected_to area_tipo_examan_url(@area_tipo_examan)
  end

  test "should destroy area_tipo_examan" do
    assert_difference("AreaTipoExamen.count", -1) do
      delete area_tipo_examan_url(@area_tipo_examan)
    end

    assert_redirected_to area_tipo_examen_index_url
  end
end
