require "test_helper"

#  EDITOR ---------------

feature "creating a post as editor" do
  scenario "editor try to create post" do
    editor_sign_in

    # Given a completed new post form
    visit new_post_path
    fill_in "Title", with: posts(:bsh).title
    fill_in "Content", with: posts(:bsh).content

    # When I submit the form
    click_on "Create Post"

    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:bsh).title
    page.has_css? "#author"
    page.text.must_include users(:one).email

  end
end

feature "creating a post as editor" do
  scenario "editor try to create post from homepage" do
    editor_sign_in

    # Given a completed new post form
    visit posts_path
    click_link "New Post"
    fill_in "Title", with: posts(:vi).title
    fill_in "Content", with: posts(:vi).content

    # When I submit the form
    click_on "Create Post"

    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:vi).title
    page.has_css? "#author"
    page.text.must_include users(:one).email

  end
end

#  AUTHOR ---------------

feature "creating a post as author" do
  scenario "author trys to create post" do
    author_sign_in

    # Given a completed new post form
    visit new_post_path
    fill_in "Title", with: posts(:bsh).title
    fill_in "Content", with: posts(:bsh).content

    # When I submit the form
    click_on "Create Post"

    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:bsh).title
    page.has_css? "#author"
    page.text.must_include users(:two).email

  end
end

feature "creating a post as author" do
  scenario "author trys to create post from homepage" do
    author_sign_in

    # Given a completed new post form
    visit posts_path
    click_link "New Post"
    fill_in "Title", with: posts(:vi).title
    fill_in "Content", with: posts(:vi).content

    # When I submit the form
    click_on "Create Post"

    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:vi).title
    page.has_css? "#author"
    page.text.must_include users(:two).email

  end
end

#  NORMAL USER ---------------

feature "creating a post as a normal user" do
  scenario "Normal user trys to create post" do
    reg_sign_in

    # Try to visit new post path
    visit new_post_path

    # Should redirect to index
    page.text.wont_include "New Post"
    page.text.wont_include "Create post"
    page.text.must_include "Recent Blog Posts"
  end
end

feature "creating a post as normal user" do
  scenario "New post will not show for normal in index" do
    reg_sign_in

    # 'New Post' won't show
    visit posts_path
    page.text.wont_include "New Post"
  end
end

