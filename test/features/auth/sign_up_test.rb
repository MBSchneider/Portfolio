require "test_helper"

feature "signing up" do
  #focus
  scenario "create User account" do

    #Given a completed user registration form
    visit new_user_registration_path
    fill_in 'Email', with: 'snoop@lion.com'
    fill_in 'Password', with: 'snooplion'
    fill_in 'Password confirmation', with: 'snooplion'
    save_and_open_page
    # When I submit the form
    click_on 'Sign up'

    # Then I should see the post & success message
    page.text.must_include 'You have signed up successfully.'

  end
end
