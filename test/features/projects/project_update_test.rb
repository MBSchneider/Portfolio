require 'test_helper'

feature 'editing a portfolio project as an editor' do
  scenario 'edit a project' do

    editor_sign_in

    # Given a completed project form
    visit project_path(projects(:mdp))
    click_on 'Edit'
    fill_in 'Title', with: projects(:cfb).title
    fill_in 'Technologies used', with: projects(:cfb).technologies_used

    # When I submit the form'
    click_on 'Update Project'

    # Then I should see the post & success message
    page.text.must_include projects(:cfb).title
    page.text.must_include projects(:cfb).technologies_used
    page.text.must_include 'Project was successfully updated.'
  end
end

feature 'try to edit a portfolio project as a normal user' do
  scenario "Doesn't show edit button" do

    # Given a completed project form
    visit project_path(projects(:mdp))

    # # Then I should see the post & success message
    # page.text.must_include 'error'
    page.text.wont_include 'Edit'
  end
end
