require "test_helper"

feature "Editing a post" do
  #focus
  scenario "select edit on a valid post" do

  #create post to test
  post = Post.create(title: "Here's my number", content: "Call me maybe?")

  # Given a completed post form
  visit post_path(post)
  click_on "Edit"
  fill_in 'Title', with: 'there is no hope'
  fill_in 'Content', with: 'the dark side is too strong'

  # When I submit the form
  click_on 'Update Post'

  # Then I should see the post & success message
  page.text.must_include "there is no hope"
  page.text.must_include "the dark side is too strong"
  page.text.must_include 'Post was successfully updated'

  end
end

# Fixture
feature "Editing a post w fixture" do
  #focus
  scenario "select edit on a valid post" do

  #create post to test
  post = Post.create(title: posts(:vi).title, content: posts(:vi).content)

  # Given a completed post form
  visit post_path(post)
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

