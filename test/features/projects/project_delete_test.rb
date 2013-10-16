require "test_helper"

feature "Deleting a portfolio project" do
  scenario "delete a project" do

  # Given a project
  visit projects_path

  #click destroy
  page.find("#102197991").click_on "Destroy"

  # Then I should no longer see the post & should see a success message
  page.text.wont_include "magic"

  end
end
