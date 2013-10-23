require "test_helper"

feature "Visit post item to see comments" do
  scenario "post shows comments on page" do
    editor_sign_in

  # Given completed comments on a post form
  visit posts_path
  page.find("#post_1002452156").click_link "Show"

    # Then post should be shown
    page.text.must_include comments(:one).body
    page.text.must_include comments(:two).body

  end
end
