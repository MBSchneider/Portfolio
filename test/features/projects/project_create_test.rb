require "test_helper"

feature "creating a portfolio project" do
  scenario "add a new project" do

  # Given a completed post form
  visit projects_path
  click_on "New Project"
  fill_in "Title", with: projects(:mdp).title

  # When I submit the form
  click_on 'Create Project'

  # Then I should see the post & success message
  page.text.must_include projects(:mdp).title
  page.text.must_include 'Project succesfully created.'

  end
end
