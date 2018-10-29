require 'test_helper'

class DocumentHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document_history = document_histories(:one)
  end

  test "should get index" do
    get document_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_document_history_url
    assert_response :success
  end

  test "should create document_history" do
    assert_difference('DocumentHistory.count') do
      post document_histories_url, params: { document_history: { document_id: @document_history.document_id, length_of_stay: @document_history.length_of_stay, max_stay: @document_history.max_stay, received_by_name: @document_history.received_by_name, received_by_office: @document_history.received_by_office, received_from_name: @document_history.received_from_name, received_from_office: @document_history.received_from_office, remarks: @document_history.remarks } }
    end

    assert_redirected_to document_history_url(DocumentHistory.last)
  end

  test "should show document_history" do
    get document_history_url(@document_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_document_history_url(@document_history)
    assert_response :success
  end

  test "should update document_history" do
    patch document_history_url(@document_history), params: { document_history: { document_id: @document_history.document_id, length_of_stay: @document_history.length_of_stay, max_stay: @document_history.max_stay, received_by_name: @document_history.received_by_name, received_by_office: @document_history.received_by_office, received_from_name: @document_history.received_from_name, received_from_office: @document_history.received_from_office, remarks: @document_history.remarks } }
    assert_redirected_to document_history_url(@document_history)
  end

  test "should destroy document_history" do
    assert_difference('DocumentHistory.count', -1) do
      delete document_history_url(@document_history)
    end

    assert_redirected_to document_histories_url
  end
end
