require "application_system_test_case"

class DocumentHistoriesTest < ApplicationSystemTestCase
  setup do
    @document_history = document_histories(:one)
  end

  test "visiting the index" do
    visit document_histories_url
    assert_selector "h1", text: "Document Histories"
  end

  test "creating a Document history" do
    visit document_histories_url
    click_on "New Document History"

    fill_in "Document", with: @document_history.document_id
    fill_in "Length Of Stay", with: @document_history.length_of_stay
    fill_in "Max Stay", with: @document_history.max_stay
    fill_in "Received By Name", with: @document_history.received_by_name
    fill_in "Received By Office", with: @document_history.received_by_office
    fill_in "Received From Name", with: @document_history.received_from_name
    fill_in "Received From Office", with: @document_history.received_from_office
    fill_in "Remarks", with: @document_history.remarks
    click_on "Create Document history"

    assert_text "Document history was successfully created"
    click_on "Back"
  end

  test "updating a Document history" do
    visit document_histories_url
    click_on "Edit", match: :first

    fill_in "Document", with: @document_history.document_id
    fill_in "Length Of Stay", with: @document_history.length_of_stay
    fill_in "Max Stay", with: @document_history.max_stay
    fill_in "Received By Name", with: @document_history.received_by_name
    fill_in "Received By Office", with: @document_history.received_by_office
    fill_in "Received From Name", with: @document_history.received_from_name
    fill_in "Received From Office", with: @document_history.received_from_office
    fill_in "Remarks", with: @document_history.remarks
    click_on "Update Document history"

    assert_text "Document history was successfully updated"
    click_on "Back"
  end

  test "destroying a Document history" do
    visit document_histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Document history was successfully destroyed"
  end
end
