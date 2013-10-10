require "test_helper"

feature "Delete a post" do
  #focus
  scenario "select delete on a valid post" do

  #create post to delete
  test_post = Post.create(title: "Big gulps, huh?", content: "Whelp, see you later!")
  visit posts_path

  # When destroy is clicked
  page.find("tr:last").click_on "Destroy"

  # Message should no longer show
  page.wont_have_content "Big gulps, huh?"
  end
end
