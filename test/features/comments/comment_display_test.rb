require "test_helper"

feature "Editor - visit post item as editor to see comments" do
  scenario "post shows all comments on page" do
    editor_sign_in

    # Given completed comments on a post form
    visit posts_path
    page.find("#post_1002452156").click_button "Show"

    # Then post should be shown
    page.text.must_include comments(:comment1).body
    page.text.must_include comments(:comment2).body
    page.text.must_include comments(:comment3).body

  end
end

feature "standard user - visits post item to see comments" do
  scenario "post shows approved comments only on page" do
    reg_sign_in

    # Given completed comments on a post form
    visit posts_path
    page.find("#post_1002452156").click_button "Show"

    # Then post should be shown
    page.text.must_include comments(:comment1).body
    page.text.must_include comments(:comment2).body
    page.text.wont_include comments(:comment3).body

  end
end
