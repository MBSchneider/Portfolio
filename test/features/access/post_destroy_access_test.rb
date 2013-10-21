require "test_helper"

#  EDITOR ---------------

feature "Delete a post as editor" do
  scenario "try to delete post from homepage" do
    editor_sign_in
    visit posts_path

    # Click destroy link
    page.find("#post_1002452156").click_link "Destroy"

    # Post will be deleted
    page.text.wont_include "We are young."
  end
end

#  AUTHOR ---------------

feature "deleting a post as author" do
  scenario "author trys to delete post from homepage" do
    author_sign_in

    # Given all posts at index
    visit posts_path
    # Edit command will not be available
    page.text.wont_include "Destroy"
  end
end

#  NORMAL USER ---------------

feature "Deleting a post as normal user" do
  scenario "Delete post will not be allowed for normal user" do
    reg_sign_in

    # 'New Post' won't show
    visit posts_path
    page.text.wont_include "Destroy"
  end
end

