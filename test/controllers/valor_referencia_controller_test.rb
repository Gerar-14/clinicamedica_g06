require "test_helper"

class ValorReferenciaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valor_referencia = valor_referencia(:one)
  end

  test "should get index" do
    get valor_referencia_index_url
    assert_response :success
  end

  test "should get new" do
    get new_valor_referencia_url
    assert_response :success
  end

  test "should create valor_referencia" do
    assert_difference("ValorReferencia.count") do
      post valor_referencia_index_url, params: { valor_referencia: { parametro_id: @valor_referencia.parametro_id, valor_referencia: @valor_referencia.valor_referencia } }
    end

    assert_redirected_to valor_referencia_url(ValorReferencia.last)
  end

  test "should show valor_referencia" do
    get valor_referencia_url(@valor_referencia)
    assert_response :success
  end

  test "should get edit" do
    get edit_valor_referencia_url(@valor_referencia)
    assert_response :success
  end

  test "should update valor_referencia" do
    patch valor_referencia_url(@valor_referencia), params: { valor_referencia: { parametro_id: @valor_referencia.parametro_id, valor_referencia: @valor_referencia.valor_referencia } }
    assert_redirected_to valor_referencia_url(@valor_referencia)
  end

  test "should destroy valor_referencia" do
    assert_difference("ValorReferencia.count", -1) do
      delete valor_referencia_url(@valor_referencia)
    end

    assert_redirected_to valor_referencia_index_url
  end
end
