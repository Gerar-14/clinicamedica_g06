require "test_helper"

class LaboratoristaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @laboratorista = laboratorista(:one)
  end

  test "should get index" do
    get laboratorista_index_url
    assert_response :success
  end

  test "should get new" do
    get new_laboratorista_url
    assert_response :success
  end

  test "should create laboratorista" do
    assert_difference("Laboratorista.count") do
      post laboratorista_index_url, params: { laboratorista: { empleado_id: @laboratorista.empleado_id, laboratorio_id: @laboratorista.laboratorio_id, num_junta_vigilancia: @laboratorista.num_junta_vigilancia } }
    end

    assert_redirected_to laboratorista_url(Laboratorista.last)
  end

  test "should show laboratorista" do
    get laboratorista_url(@laboratorista)
    assert_response :success
  end

  test "should get edit" do
    get edit_laboratorista_url(@laboratorista)
    assert_response :success
  end

  test "should update laboratorista" do
    patch laboratorista_url(@laboratorista), params: { laboratorista: { empleado_id: @laboratorista.empleado_id, laboratorio_id: @laboratorista.laboratorio_id, num_junta_vigilancia: @laboratorista.num_junta_vigilancia } }
    assert_redirected_to laboratorista_url(@laboratorista)
  end

  test "should destroy laboratorista" do
    assert_difference("Laboratorista.count", -1) do
      delete laboratorista_url(@laboratorista)
    end

    assert_redirected_to laboratorista_index_url
  end
end
