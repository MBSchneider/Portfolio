require "test_helper"

feature "creating a comment" do
  #focus
  scenario "create comment on post" do
    editor_sign_in

    # Given a completed post form
    visit posts_path
    page.find("#post_1002452156").click_link "Show"

    page.click_on "Add comment"
    fill_in "body", with: comments(:one).body

    # When I submit a comment
    click_on "Create comment"

    # Then a comment should be created and displayed
    page.text.must_include "Comment was successfully created"
    page.text.must_include comments(:one).body
    page.text.must_include users(:one).email

  end
end


