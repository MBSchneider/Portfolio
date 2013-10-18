require "test_helper"

feature "Editing a post" do
  #focus
  scenario "select edit on a valid post" do

  sign_in

  visit post_path(posts(:vi))

  # Given a completed post form
  click_on "Edit"
  fill_in 'Title', with: posts(:bsh).title
  fill_in 'Content', with: posts(:bsh).content

  # When I submit the form
  click_on 'Update Post'

  # Then I should see the post & success message
  page.text.must_include posts(:bsh).title
  page.text.must_include posts(:bsh).content
  page.text.must_include 'Post was successfully updated'

  end
end

