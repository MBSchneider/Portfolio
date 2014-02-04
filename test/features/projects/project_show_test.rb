require 'test_helper'

feature 'viewing a portfolio project' do
  scenario 'view a project' do
    visit projects_path

    find('#786063105').find('img').click

    page.text.must_include projects(:mdp).title
  end
end
