require "test_helper"

class TipoExamenParametrosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_examen_parametro = tipo_examen_parametros(:one)
  end

  test "should get index" do
    get tipo_examen_parametros_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_examen_parametro_url
    assert_response :success
  end

  test "should create tipo_examen_parametro" do
    assert_difference("TipoExamenParametro.count") do
      post tipo_examen_parametros_url, params: { tipo_examen_parametro: { parametro_id: @tipo_examen_parametro.parametro_id, tipo_examen_id: @tipo_examen_parametro.tipo_examen_id } }
    end

    assert_redirected_to tipo_examen_parametro_url(TipoExamenParametro.last)
  end

  test "should show tipo_examen_parametro" do
    get tipo_examen_parametro_url(@tipo_examen_parametro)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_examen_parametro_url(@tipo_examen_parametro)
    assert_response :success
  end

  test "should update tipo_examen_parametro" do
    patch tipo_examen_parametro_url(@tipo_examen_parametro), params: { tipo_examen_parametro: { parametro_id: @tipo_examen_parametro.parametro_id, tipo_examen_id: @tipo_examen_parametro.tipo_examen_id } }
    assert_redirected_to tipo_examen_parametro_url(@tipo_examen_parametro)
  end

  test "should destroy tipo_examen_parametro" do
    assert_difference("TipoExamenParametro.count", -1) do
      delete tipo_examen_parametro_url(@tipo_examen_parametro)
    end

    assert_redirected_to tipo_examen_parametros_url
  end
end
