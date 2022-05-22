require "test_helper"

class PaisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pais = pais(:one)
  end

  test "should get index" do
    get pais_index_url
    assert_response :success
  end

  test "should get new" do
    get new_pais_url
    assert_response :success
  end

  test "should create pais" do
    assert_difference("Pais.count") do
      post pais_index_url, params: { pais: { nombre_pais: @pais.nombre_pais } }
    end

    assert_redirected_to pais_url(Pais.last)
  end

  test "should show pais" do
    get pais_url(@pais)
    assert_response :success
  end

  test "should get edit" do
    get edit_pais_url(@pais)
    assert_response :success
  end

  test "should update pais" do
    patch pais_url(@pais), params: { pais: { nombre_pais: @pais.nombre_pais } }
    assert_redirected_to pais_url(@pais)
  end

  test "should destroy pais" do
    assert_difference("Pais.count", -1) do
      delete pais_url(@pais)
    end

    assert_redirected_to pais_index_url
  end
end
