require "test_helper"

feature "Delete a comment" do
  #focus
  scenario "select delete on a valid post" do

  # Given a completed comment on a post form
  visit posts_path

  page.find("#post_1002452156").click_link "Show"

# click destroy
  page.click_on "Destroy comment"

  # Then I should not see the comment
  page.text.wont_include comments(:one).body

  end
end
