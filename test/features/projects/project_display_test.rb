require 'test_helper'

feature 'viewing project index' do
  scenario 'index shows all projects' do
    # When visiting the index view
    visit projects_path

    # Then I should see all the project titles and technologies
    page.text.must_include projects(:mdp).title
    page.text.must_include projects(:bp).title
    page.text.must_include projects(:cfb).title
    page.text.must_include projects(:mdp).technologies_used
    page.text.must_include projects(:bp).technologies_used
    page.text.must_include projects(:cfb).technologies_used

  end
end
