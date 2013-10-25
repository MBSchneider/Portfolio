require "test_helper"

feature "creating a comment" do
  #focus
  scenario "create comment on post" do
    editor_sign_in

    # Given a completed post form
    visit posts_path
    page.find("#post_1002452156").click_button "Show"

    fill_in "comment_body", with: comments(:comment3).body

    # When I submit a comment
    click_on "Create Comment"

    # Then a comment should be created and displayed
    page.text.must_include "Comment was successfully created"
    page.text.must_include comments(:comment3).body
    page.text.must_include users(:one).email

  end
end

feature "creating a comment" do
  #focus
  scenario "create comment on project" do
    editor_sign_in

    # Given a completed post form
    visit projects_path

    page.find("#102197991").click_link "Show"

    fill_in "comment_body", with: comments(:comment4).body

    # When I submit a comment
    click_on "Create Comment"

    # Then a comment should be created and displayed
    page.text.must_include "Comment was successfully created"
    page.text.must_include comments(:comment4).body
    page.text.must_include users(:one).email

  end
end


