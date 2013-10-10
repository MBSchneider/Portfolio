require "test_helper"

feature "Visiting Post home page" do
  scenario "posts exits on page" do
    # Given that posts were placed on page
    Post.create(title: "I'm free", content: "Free fallin'!")

    # Visit post index
    visit posts_path

    # Then post should be shown
    page.text.must_include "Free fallin'!"
  end
end
