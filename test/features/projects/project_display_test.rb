require "test_helper"

feature "viewing project index" do
  scenario "index shows all projects" do

  # Given a project
  visit projects_path

  # Then I should see the post & success message
  page.text.must_include projects(:mdp).title
  page.text.must_include projects(:bp).title
  page.text.must_include projects(:cfb).title
  page.text.must_include projects(:mdp).technologies_used
  page.text.must_include projects(:bp).technologies_used
  page.text.must_include projects(:cfb).technologies_used

end
end
