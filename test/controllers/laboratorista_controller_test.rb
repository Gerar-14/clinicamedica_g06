require "test_helper"

class LaboratoristaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @laboratoristum = laboratorista(:one)
  end

  test "should get index" do
    get laboratorista_index_url
    assert_response :success
  end

  test "should get new" do
    get new_laboratoristum_url
    assert_response :success
  end

  test "should create laboratoristum" do
    assert_difference("Laboratorista.count") do
      post laboratorista_index_url, params: { laboratoristum: { empleado_id: @laboratoristum.empleado_id, laboratorio_id: @laboratoristum.laboratorio_id, num_junta_vigilancia: @laboratoristum.num_junta_vigilancia } }
    end

    assert_redirected_to laboratoristum_url(Laboratorista.last)
  end

  test "should show laboratoristum" do
    get laboratoristum_url(@laboratoristum)
    assert_response :success
  end

  test "should get edit" do
    get edit_laboratoristum_url(@laboratoristum)
    assert_response :success
  end

  test "should update laboratoristum" do
    patch laboratoristum_url(@laboratoristum), params: { laboratoristum: { empleado_id: @laboratoristum.empleado_id, laboratorio_id: @laboratoristum.laboratorio_id, num_junta_vigilancia: @laboratoristum.num_junta_vigilancia } }
    assert_redirected_to laboratoristum_url(@laboratoristum)
  end

  test "should destroy laboratoristum" do
    assert_difference("Laboratorista.count", -1) do
      delete laboratoristum_url(@laboratoristum)
    end

    assert_redirected_to laboratorista_index_url
  end
end
