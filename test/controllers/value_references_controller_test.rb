require "test_helper"

class ValueReferencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @value_reference = value_references(:one)
  end

  test "should get index" do
    get value_references_url
    assert_response :success
  end

  test "should get new" do
    get new_value_reference_url
    assert_response :success
  end

  test "should create value_reference" do
    assert_difference("ValueReference.count") do
      post value_references_url, params: { value_reference: { parametro_id: @value_reference.parametro_id, value_reference: @value_reference.value_reference } }
    end

    assert_redirected_to value_reference_url(ValueReference.last)
  end

  test "should show value_reference" do
    get value_reference_url(@value_reference)
    assert_response :success
  end

  test "should get edit" do
    get edit_value_reference_url(@value_reference)
    assert_response :success
  end

  test "should update value_reference" do
    patch value_reference_url(@value_reference), params: { value_reference: { parametro_id: @value_reference.parametro_id, value_reference: @value_reference.value_reference } }
    assert_redirected_to value_reference_url(@value_reference)
  end

  test "should destroy value_reference" do
    assert_difference("ValueReference.count", -1) do
      delete value_reference_url(@value_reference)
    end

    assert_redirected_to value_references_url
  end
end
