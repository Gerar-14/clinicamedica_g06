require "test_helper"

class OrdenTipoExamenControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orden_tipo_examen = orden_tipo_examen(:one)
  end

  test "should get index" do
    get orden_tipo_examen_index_url
    assert_response :success
  end

  test "should get new" do
    get new_orden_tipo_examen_url
    assert_response :success
  end

  test "should create orden_tipo_examen" do
    assert_difference("OrdenTipoExamen.count") do
      post orden_tipo_examen_index_url, params: { orden_tipo_examen: { orden_id: @orden_tipo_examen.orden_id, tipo_examen_id: @orden_tipo_examen.tipo_examen_id } }
    end

    assert_redirected_to orden_tipo_examen_url(OrdenTipoExamen.last)
  end

  test "should show orden_tipo_examen" do
    get orden_tipo_examen_url(@orden_tipo_examen)
    assert_response :success
  end

  test "should get edit" do
    get edit_orden_tipo_examen_url(@orden_tipo_examen)
    assert_response :success
  end

  test "should update orden_tipo_examen" do
    patch orden_tipo_examen_url(@orden_tipo_examen), params: { orden_tipo_examen: { orden_id: @orden_tipo_examen.orden_id, tipo_examen_id: @orden_tipo_examen.tipo_examen_id } }
    assert_redirected_to orden_tipo_examen_url(@orden_tipo_examen)
  end

  test "should destroy orden_tipo_examen" do
    assert_difference("OrdenTipoExamen.count", -1) do
      delete orden_tipo_examen_url(@orden_tipo_examen)
    end

    assert_redirected_to orden_tipo_examen_index_url
  end
end
