require "test_helper"

class CaracolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @caracol = caracols(:one)
  end

  test "should get index" do
    get caracols_url
    assert_response :success
  end

  test "should get new" do
    get new_caracol_url
    assert_response :success
  end

  test "should create caracol" do
    assert_difference("Caracol.count") do
      post caracols_url, params: { caracol: { nombre: @caracol.nombre } }
    end

    assert_redirected_to caracol_url(Caracol.last)
  end

  test "should show caracol" do
    get caracol_url(@caracol)
    assert_response :success
  end

  test "should get edit" do
    get edit_caracol_url(@caracol)
    assert_response :success
  end

  test "should update caracol" do
    patch caracol_url(@caracol), params: { caracol: { nombre: @caracol.nombre } }
    assert_redirected_to caracol_url(@caracol)
  end

  test "should destroy caracol" do
    assert_difference("Caracol.count", -1) do
      delete caracol_url(@caracol)
    end

    assert_redirected_to caracols_url
  end
end
