require "test_helper"

feature "Editor - visit post item as editor to see comments" do
  scenario "post shows all comments on page" do
    editor_sign_in

    # Given completed comments on a post form
    visit posts_path

    page.find("#post_1002452156").click_link posts(:way).title

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
    page.find("#post_1002452156").click_link posts(:way).title

    # Then post should be shown
    page.text.must_include comments(:comment1).body
    page.text.must_include comments(:comment2).body
    page.text.wont_include comments(:comment3).body

  end
end

feature "Editor - visit project as editor to see comments" do
  scenario "project shows all comments on page" do
    editor_sign_in

    # Given completed comments on a project form
    visit project_path(projects(:bp))

    # page.find("#102197991").find("img").click



    # Then post should be shown
    page.text.must_include comments(:comment4).body
    page.text.must_include comments(:comment5).body

  end
end

feature "standard user - visits project item to see comments" do
  scenario "project shows approved comments only on page" do
    reg_sign_in

    # Given completed comments on a project form
    visit projects_path

    visit project_path(projects(:bp))

    # Then post should be shown
    page.text.must_include comments(:comment4).body
    page.text.wont_include comments(:comment5).body

  end
end
