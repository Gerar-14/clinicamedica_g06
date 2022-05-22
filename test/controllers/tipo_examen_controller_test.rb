require "test_helper"

class TipoExamenControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_examan = tipo_examen(:one)
  end

  test "should get index" do
    get tipo_examen_index_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_examan_url
    assert_response :success
  end

  test "should create tipo_examan" do
    assert_difference("TipoExamen.count") do
      post tipo_examen_index_url, params: { tipo_examan: { nombre_tipo_examen: @tipo_examan.nombre_tipo_examen } }
    end

    assert_redirected_to tipo_examan_url(TipoExamen.last)
  end

  test "should show tipo_examan" do
    get tipo_examan_url(@tipo_examan)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_examan_url(@tipo_examan)
    assert_response :success
  end

  test "should update tipo_examan" do
    patch tipo_examan_url(@tipo_examan), params: { tipo_examan: { nombre_tipo_examen: @tipo_examan.nombre_tipo_examen } }
    assert_redirected_to tipo_examan_url(@tipo_examan)
  end

  test "should destroy tipo_examan" do
    assert_difference("TipoExamen.count", -1) do
      delete tipo_examan_url(@tipo_examan)
    end

    assert_redirected_to tipo_examen_index_url
  end
end
