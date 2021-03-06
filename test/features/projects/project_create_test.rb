require 'test_helper'

feature 'creating a portfolio project as an editor' do
  scenario 'add a new project' do
    editor_sign_in

    # Given a completed project form
    visit projects_path

    click_on 'New Project'
    fill_in 'Title', with: projects(:mdp).title
    fill_in 'Technologies used', with: projects(:mdp).technologies_used

    # When I submit the form'
    click_on 'Create Project'

    # Then I should see the post & success message
    page.text.must_include projects(:mdp).title
    page.text.must_include 'Project was successfully created.'
  end
end

feature "shouldn't create project with missing information" do
  scenario 'project not created' do

    editor_sign_in

    # Given an incomplete project form
    visit projects_path
    click_on 'New Project'

    # Nothing completed when form submitted
    click_on 'Create Project'

    # Then project should not be created
    page.text.wont_include 'Project succesfully created.'
    page.text.must_include 'review the problems below'

  end
end

feature 'non-edior should not be able to create a project' do
  scenario 'create project button not available' do

    # Given a project form with title less than required length
    visit projects_path
    # click_on 'New Project'
    # fill_in 'Title', with: projects(:bp).title
    # fill_in 'Technologies used', with: projects(:bp).technologies_used

    # # When I submit the form'
    # click_on 'Create Project'

    # Then project should not be created
    page.text.wont_include 'New Project'
    # page.text.must_include 'prohibited this project from being saved'
  end
end
