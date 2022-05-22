require "test_helper"

class OrdenTipoExamenControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orden_tipo_examan = orden_tipo_examen(:one)
  end

  test "should get index" do
    get orden_tipo_examen_index_url
    assert_response :success
  end

  test "should get new" do
    get new_orden_tipo_examan_url
    assert_response :success
  end

  test "should create orden_tipo_examan" do
    assert_difference("OrdenTipoExamen.count") do
      post orden_tipo_examen_index_url, params: { orden_tipo_examan: { orden_id: @orden_tipo_examan.orden_id, tipo_examen_id: @orden_tipo_examan.tipo_examen_id } }
    end

    assert_redirected_to orden_tipo_examan_url(OrdenTipoExamen.last)
  end

  test "should show orden_tipo_examan" do
    get orden_tipo_examan_url(@orden_tipo_examan)
    assert_response :success
  end

  test "should get edit" do
    get edit_orden_tipo_examan_url(@orden_tipo_examan)
    assert_response :success
  end

  test "should update orden_tipo_examan" do
    patch orden_tipo_examan_url(@orden_tipo_examan), params: { orden_tipo_examan: { orden_id: @orden_tipo_examan.orden_id, tipo_examen_id: @orden_tipo_examan.tipo_examen_id } }
    assert_redirected_to orden_tipo_examan_url(@orden_tipo_examan)
  end

  test "should destroy orden_tipo_examan" do
    assert_difference("OrdenTipoExamen.count", -1) do
      delete orden_tipo_examan_url(@orden_tipo_examan)
    end

    assert_redirected_to orden_tipo_examen_index_url
  end
end
