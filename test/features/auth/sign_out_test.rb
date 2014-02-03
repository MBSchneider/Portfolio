require "test_helper"

feature "sign out" do
  #focus
  scenario "sign out user" do

    reg_sign_in

    page.driver.submit :delete, destroy_user_session_path, {}

    page.text.must_include 'Signed out successfully.'

  end
end
