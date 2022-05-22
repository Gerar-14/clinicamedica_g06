require "test_helper"

class MuestrasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @muestra = muestra(:one)
  end

  test "should get index" do
    get muestras_url
    assert_response :success
  end

  test "should get new" do
    get new_muestra_url
    assert_response :success
  end

  test "should create muestra" do
    assert_difference("Muestra.count") do
      post muestras_url, params: { muestra: { empleado_id: @muestra.empleado_id, fecha_entrega_muestra: @muestra.fecha_entrega_muestra, orden_tipo_examen_id: @muestra.orden_tipo_examen_id, tipo_muestra: @muestra.tipo_muestra } }
    end

    assert_redirected_to muestra_url(Muestra.last)
  end

  test "should show muestra" do
    get muestra_url(@muestra)
    assert_response :success
  end

  test "should get edit" do
    get edit_muestra_url(@muestra)
    assert_response :success
  end

  test "should update muestra" do
    patch muestra_url(@muestra), params: { muestra: { empleado_id: @muestra.empleado_id, fecha_entrega_muestra: @muestra.fecha_entrega_muestra, orden_tipo_examen_id: @muestra.orden_tipo_examen_id, tipo_muestra: @muestra.tipo_muestra } }
    assert_redirected_to muestra_url(@muestra)
  end

  test "should destroy muestra" do
    assert_difference("Muestra.count", -1) do
      delete muestra_url(@muestra)
    end

    assert_redirected_to muestras_url
  end
end
