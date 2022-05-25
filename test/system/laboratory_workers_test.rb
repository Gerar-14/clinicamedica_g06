require "application_system_test_case"

class LaboratoryWorkersTest < ApplicationSystemTestCase
  setup do
    @laboratory_worker = laboratory_workers(:one)
  end

  test "visiting the index" do
    visit laboratory_workers_url
    assert_selector "h1", text: "Laboratory workers"
  end

  test "should create laboratory worker" do
    visit laboratory_workers_url
    click_on "New laboratory worker"

    fill_in "Empleado", with: @laboratory_worker.empleado_id
    fill_in "Laboratorio", with: @laboratory_worker.laboratorio_id
    fill_in "Num junta vigilancia", with: @laboratory_worker.num_junta_vigilancia
    click_on "Create Laboratory worker"

    assert_text "Laboratory worker was successfully created"
    click_on "Back"
  end

  test "should update Laboratory worker" do
    visit laboratory_worker_url(@laboratory_worker)
    click_on "Edit this laboratory worker", match: :first

    fill_in "Empleado", with: @laboratory_worker.empleado_id
    fill_in "Laboratorio", with: @laboratory_worker.laboratorio_id
    fill_in "Num junta vigilancia", with: @laboratory_worker.num_junta_vigilancia
    click_on "Update Laboratory worker"

    assert_text "Laboratory worker was successfully updated"
    click_on "Back"
  end

  test "should destroy Laboratory worker" do
    visit laboratory_worker_url(@laboratory_worker)
    click_on "Destroy this laboratory worker", match: :first

    assert_text "Laboratory worker was successfully destroyed"
  end
end
