require "test_helper"

feature "sign in" do
  #focus
  scenario "sign in user" do

    visit root_path

    #Given a valid user sign in
    click_on 'Sign In'

    fill_in 'Email', with: users(:one).email
    fill_in 'Password', with: "password"

    # When I submit the form
    click_on 'Sign in'

    # Then I should see the post & success message
    page.text.must_include 'Signed in successfully.'

  end
end
