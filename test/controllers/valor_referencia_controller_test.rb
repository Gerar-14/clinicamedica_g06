require "test_helper"

class ValorReferenciaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valor_referencium = valor_referencia(:one)
  end

  test "should get index" do
    get valor_referencia_index_url
    assert_response :success
  end

  test "should get new" do
    get new_valor_referencium_url
    assert_response :success
  end

  test "should create valor_referencium" do
    assert_difference("ValorReferencia.count") do
      post valor_referencia_index_url, params: { valor_referencium: { parametro_id: @valor_referencium.parametro_id, valor_referencia: @valor_referencium.valor_referencia } }
    end

    assert_redirected_to valor_referencium_url(ValorReferencia.last)
  end

  test "should show valor_referencium" do
    get valor_referencium_url(@valor_referencium)
    assert_response :success
  end

  test "should get edit" do
    get edit_valor_referencium_url(@valor_referencium)
    assert_response :success
  end

  test "should update valor_referencium" do
    patch valor_referencium_url(@valor_referencium), params: { valor_referencium: { parametro_id: @valor_referencium.parametro_id, valor_referencia: @valor_referencium.valor_referencia } }
    assert_redirected_to valor_referencium_url(@valor_referencium)
  end

  test "should destroy valor_referencium" do
    assert_difference("ValorReferencia.count", -1) do
      delete valor_referencium_url(@valor_referencium)
    end

    assert_redirected_to valor_referencia_index_url
  end
end
