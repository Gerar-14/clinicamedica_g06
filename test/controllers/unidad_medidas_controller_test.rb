require "test_helper"

class UnidadMedidasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unidad_medida = unidad_medidas(:one)
  end

  test "should get index" do
    get unidad_medidas_url
    assert_response :success
  end

  test "should get new" do
    get new_unidad_medida_url
    assert_response :success
  end

  test "should create unidad_medida" do
    assert_difference("UnidadMedida.count") do
      post unidad_medidas_url, params: { unidad_medida: { descripcion_unidad_medida: @unidad_medida.descripcion_unidad_medida, nombre_unidad_medida: @unidad_medida.nombre_unidad_medida, siglas: @unidad_medida.siglas, sistema_medida: @unidad_medida.sistema_medida } }
    end

    assert_redirected_to unidad_medida_url(UnidadMedida.last)
  end

  test "should show unidad_medida" do
    get unidad_medida_url(@unidad_medida)
    assert_response :success
  end

  test "should get edit" do
    get edit_unidad_medida_url(@unidad_medida)
    assert_response :success
  end

  test "should update unidad_medida" do
    patch unidad_medida_url(@unidad_medida), params: { unidad_medida: { descripcion_unidad_medida: @unidad_medida.descripcion_unidad_medida, nombre_unidad_medida: @unidad_medida.nombre_unidad_medida, siglas: @unidad_medida.siglas, sistema_medida: @unidad_medida.sistema_medida } }
    assert_redirected_to unidad_medida_url(@unidad_medida)
  end

  test "should destroy unidad_medida" do
    assert_difference("UnidadMedida.count", -1) do
      delete unidad_medida_url(@unidad_medida)
    end

    assert_redirected_to unidad_medidas_url
  end
end
