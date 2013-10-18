require "test_helper"

feature "creating a post" do
  #focus
  scenario "works with valid data" do
    sign_in

    # Given a completed new post form
    visit new_post_path
    fill_in "Title", with: posts(:bsh).title
    fill_in "Content", with: posts(:bsh).content

    # When I submit the form
    click_on "Create Post"

    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:bsh).title
    page.has_css? "#author"
    page.text.must_include users(:one).email

  end
end


