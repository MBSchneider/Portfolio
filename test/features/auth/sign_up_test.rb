require "test_helper"

feature "signing up" do
  #focus
  scenario "create User account" do

    #Given a completed user registration form
    visit posts_path

    click_on "Sign Up"

    fill_in 'Email', with: 'dave@lion.com'
    fill_in 'Password', with: 'davelion'
    fill_in 'Password confirmation', with: 'davelion'

    # When I submit the form
    click_on 'Sign up'

    # Then I should see the post & success message
    page.text.must_include 'You have signed up successfully.'

  end
end
