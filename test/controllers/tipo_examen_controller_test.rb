require "test_helper"

class TipoExamenControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_examen = tipo_examen(:one)
  end

  test "should get index" do
    get tipo_examen_index_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_examen_url
    assert_response :success
  end

  test "should create tipo_examen" do
    assert_difference("TipoExamen.count") do
      post tipo_examen_index_url, params: { tipo_examen: { nombre_tipo_examen: @tipo_examen.nombre_tipo_examen } }
    end

    assert_redirected_to tipo_examen_url(TipoExamen.last)
  end

  test "should show tipo_examen" do
    get tipo_examen_url(@tipo_examen)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_examen_url(@tipo_examen)
    assert_response :success
  end

  test "should update tipo_examen" do
    patch tipo_examen_url(@tipo_examen), params: { tipo_examen: { nombre_tipo_examen: @tipo_examen.nombre_tipo_examen } }
    assert_redirected_to tipo_examen_url(@tipo_examen)
  end

  test "should destroy tipo_examen" do
    assert_difference("TipoExamen.count", -1) do
      delete tipo_examen_url(@tipo_examen)
    end

    assert_redirected_to tipo_examen_index_url
  end
end
