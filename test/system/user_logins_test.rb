require "application_system_test_case"

class UserLoginsTest < ApplicationSystemTestCase
  setup do
    @user_login = user_logins(:one)
  end

  test "visiting the index" do
    visit user_logins_url
    assert_selector "h1", text: "User Logins"
  end

  test "creating a User login" do
    visit user_logins_url
    click_on "New User Login"

    fill_in "Timestamp", with: @user_login.timestamp
    fill_in "User", with: @user_login.user_id
    click_on "Create User login"

    assert_text "User login was successfully created"
    click_on "Back"
  end

  test "updating a User login" do
    visit user_logins_url
    click_on "Edit", match: :first

    fill_in "Timestamp", with: @user_login.timestamp
    fill_in "User", with: @user_login.user_id
    click_on "Update User login"

    assert_text "User login was successfully updated"
    click_on "Back"
  end

  test "destroying a User login" do
    visit user_logins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User login was successfully destroyed"
  end
end
