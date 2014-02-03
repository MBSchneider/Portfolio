require "test_helper"

feature "Visiting Post home page" do
  scenario "posts exists on page" do
    # Given that posts were placed on page
    post = Post.create(title: posts(:bsh).title, content: posts(:bsh).content)

    # Visit post index
    visit posts_path

    # Then post should be shown
    page.text.must_include posts(:bsh).title
  end
end
