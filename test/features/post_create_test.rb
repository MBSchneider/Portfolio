require "test_helper"

feature "creating a post" do
  #focus
  scenario "works with valid data" do

  # Given a completed post form
  visit posts_path
  click_on "New Post"
  fill_in 'Title', with: 'a new hope'
  fill_in 'Content', with: 'a long time ago in a galaxy far away'

  # When I submit the form
  click_on 'Create Post'

  # Then I should see the post & success message
  page.text.must_include "a long time ago in a galaxy far away"
  page.text.must_include "a new hope"
  page.text.must_include 'Post was successfully created'

  end
end

# Test with Fixtures
feature "creating a post w fixture" do
  #focus
  scenario "works with valid data" do
    # Given a completed new post form
    visit new_post_path
    fill_in "Title", with: posts(:bsh).title
    fill_in "Content", with: posts(:bsh).content

    # When I submit the form
    click_on "Create Post"

    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:bsh).title
  end
end
