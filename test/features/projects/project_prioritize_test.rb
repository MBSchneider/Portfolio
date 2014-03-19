require 'test_helper'

feature 'prioritize projects as an editor' do
  scenario 'decrease project priority' do
    editor_sign_in
    visit project_path(projects(:mdp))
    click_link 'Edit'
    fill_in 'Priority', with: 3
    click_on 'Update Project'
    visit projects_path

    Project.find(projects(:bp)).priority.must_equal 1
    Project.find(projects(:cfb)).priority.must_equal 2
    Project.find(projects(:mdp)).priority.must_equal 3
    Project.find(projects(:dd)).priority.must_equal 4
  end
end

feature 'prioritize projects as an editor' do
  scenario 'increase project priority' do
    editor_sign_in
    visit project_path(projects(:cfb))
    click_link 'Edit'
    fill_in 'Priority', with: 1
    click_on 'Update Project'
    visit projects_path

    Project.find(projects(:cfb)).priority.must_equal 1
    Project.find(projects(:mdp)).priority.must_equal 2
    Project.find(projects(:bp)).priority.must_equal 3
    Project.find(projects(:dd)).priority.must_equal 4
  end
end
