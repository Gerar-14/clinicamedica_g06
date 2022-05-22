require "test_helper"

class ResultadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resultado = resultados(:one)
  end

  test "should get index" do
    get resultados_url
    assert_response :success
  end

  test "should get new" do
    get new_resultado_url
    assert_response :success
  end

  test "should create resultado" do
    assert_difference("Resultado.count") do
      post resultados_url, params: { resultado: { descripcion: @resultado.descripcion, orden_id: @resultado.orden_id, parametro_id: @resultado.parametro_id } }
    end

    assert_redirected_to resultado_url(Resultado.last)
  end

  test "should show resultado" do
    get resultado_url(@resultado)
    assert_response :success
  end

  test "should get edit" do
    get edit_resultado_url(@resultado)
    assert_response :success
  end

  test "should update resultado" do
    patch resultado_url(@resultado), params: { resultado: { descripcion: @resultado.descripcion, orden_id: @resultado.orden_id, parametro_id: @resultado.parametro_id } }
    assert_redirected_to resultado_url(@resultado)
  end

  test "should destroy resultado" do
    assert_difference("Resultado.count", -1) do
      delete resultado_url(@resultado)
    end

    assert_redirected_to resultados_url
  end
end
