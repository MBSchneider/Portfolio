require "test_helper"

#  EDITOR ---------------

feature "Editing a post as editor" do
  scenario "try to edit post" do
    editor_sign_in

    # Given a completed new post form
    visit post_path(posts(:vi))
    click_link "Edit"
    fill_in "Title", with: posts(:bsh).title
    fill_in "Content", with: posts(:bsh).content

    # When I submit the form
    click_on "Update Post"

    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully updated."
    page.text.must_include posts(:bsh).title
    page.has_css? "#author"
    page.text.must_include users(:one).email

  end
end

feature "editing a post as editor" do
  scenario "try to edit post from homepage" do
    editor_sign_in
    visit posts_path

    # Click edit link
    page.find("#post_1002452156").click_link "Edit"

    fill_in "Title", with: posts(:bsh).title
    fill_in "Content", with: posts(:bsh).content

    # When I submit the form
    click_on "Update Post"

    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully updated"
    page.text.must_include posts(:bsh).title
    page.has_css? "#author"
    page.text.must_include users(:one).email

  end
end

#  AUTHOR ---------------

feature "editing a post as author" do
  scenario "trys to edit post" do
    author_sign_in

    # Given post form
    visit post_path(posts(:vi))

    # Edit command will not be available
    page.text.wont_include "Edit"
    page.text.must_include posts(:vi).title

  end
end

feature "editing a post as author" do
  scenario "author trys to edit post from homepage" do
    author_sign_in

    # Given all posts at index
    visit posts_path
    # Edit command will not be available
    page.text.wont_include "Edit"
  end
end

#  NORMAL USER ---------------

feature "editing a post as a normal user" do
  scenario "user trys to edit post" do
    reg_sign_in

    # Given post form
    visit post_path(posts(:vi))

    # Edit command will not be available
    page.text.wont_include "Edit"
    page.text.must_include posts(:vi).title

  end
end

feature "editing a post as normal user" do
  scenario "Edit post will not show for normal in index" do
    reg_sign_in

    # 'New Post' won't show
    visit posts_path
    page.text.wont_include "Edit"
  end
end

