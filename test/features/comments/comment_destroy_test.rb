require "test_helper"

feature "Delete a comment" do

  scenario "select X to delete a comment" do

  editor_sign_in

  # Given a completed comment on a post form
  visit posts_path

  page.find("#post_1002452156").click_button "Show"

  # click destroy
  page.find("#comment_122467993").click_button "X"

  # Then I should not see the comment
  page.text.wont_include "One comment"

  end
end
