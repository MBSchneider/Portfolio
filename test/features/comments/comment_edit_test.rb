require "test_helper"

feature "Editing a comment" do
  #focus
  scenario "select edit on a valid comment" do
  editor_sign_in

  # Given a completed comment on a post form
  visit posts_path
  page.find("#post_1002452156").click_link "Show"

  page.click_on "Edit comment"
  fill_in "body", with: comments(:two).body

  #click update comment
  page.click_on "Update comment"

  # comment should be updated
  page.must_have_content comments(:two).body
  page.wont_have_content comments(:one).body


  end
end

