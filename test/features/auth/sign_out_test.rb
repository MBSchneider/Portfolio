require "test_helper"

feature "sign out" do
  #focus
  scenario "sign out user" do

    visit root_path

    #given a signed in user
    click_on 'Sign In'
    fill_in 'Email', with: users(:one).email
    fill_in 'Password', with: "password"
    click_on 'Sign in'

    #sign out
    click_on 'Sign Out'

    # Then I should see the post & success message
    page.text.must_include 'Signed out successfully.'

  end
end
