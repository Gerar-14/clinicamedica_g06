require "test_helper"

class LaboratoryWorkersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @laboratory_worker = laboratory_workers(:one)
  end

  test "should get index" do
    get laboratory_workers_url
    assert_response :success
  end

  test "should get new" do
    get new_laboratory_worker_url
    assert_response :success
  end

  test "should create laboratory_worker" do
    assert_difference("LaboratoryWorker.count") do
      post laboratory_workers_url, params: { laboratory_worker: { empleado_id: @laboratory_worker.empleado_id, laboratorio_id: @laboratory_worker.laboratorio_id, num_junta_vigilancia: @laboratory_worker.num_junta_vigilancia } }
    end

    assert_redirected_to laboratory_worker_url(LaboratoryWorker.last)
  end

  test "should show laboratory_worker" do
    get laboratory_worker_url(@laboratory_worker)
    assert_response :success
  end

  test "should get edit" do
    get edit_laboratory_worker_url(@laboratory_worker)
    assert_response :success
  end

  test "should update laboratory_worker" do
    patch laboratory_worker_url(@laboratory_worker), params: { laboratory_worker: { empleado_id: @laboratory_worker.empleado_id, laboratorio_id: @laboratory_worker.laboratorio_id, num_junta_vigilancia: @laboratory_worker.num_junta_vigilancia } }
    assert_redirected_to laboratory_worker_url(@laboratory_worker)
  end

  test "should destroy laboratory_worker" do
    assert_difference("LaboratoryWorker.count", -1) do
      delete laboratory_worker_url(@laboratory_worker)
    end

    assert_redirected_to laboratory_workers_url
  end
end
