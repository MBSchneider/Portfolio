require "test_helper"

feature "viewing a portfolio project" do
  scenario "view a project" do

  # Given a project
  visit projects_path
  save_and_open_page


  within("#786063105") do
    click_on "Show"
  end

  # Then I should see the post & success message
  page.text.must_include projects(:mdp).title
end
end
