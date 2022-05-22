require "test_helper"

class TipoSangresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_sangre = tipo_sangre(:one)
  end

  test "should get index" do
    get tipo_sangres_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_sangre_url
    assert_response :success
  end

  test "should create tipo_sangre" do
    assert_difference("TipoSangre.count") do
      post tipo_sangres_url, params: { tipo_sangre: { nombre_tipo_sangre: @tipo_sangre.nombre_tipo_sangre } }
    end

    assert_redirected_to tipo_sangre_url(TipoSangre.last)
  end

  test "should show tipo_sangre" do
    get tipo_sangre_url(@tipo_sangre)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_sangre_url(@tipo_sangre)
    assert_response :success
  end

  test "should update tipo_sangre" do
    patch tipo_sangre_url(@tipo_sangre), params: { tipo_sangre: { nombre_tipo_sangre: @tipo_sangre.nombre_tipo_sangre } }
    assert_redirected_to tipo_sangre_url(@tipo_sangre)
  end

  test "should destroy tipo_sangre" do
    assert_difference("TipoSangre.count", -1) do
      delete tipo_sangre_url(@tipo_sangre)
    end

    assert_redirected_to tipo_sangres_url
  end
end
