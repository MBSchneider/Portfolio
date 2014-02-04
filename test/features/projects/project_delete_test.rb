require 'test_helper'

feature 'Deleting a portfolio project' do
  scenario 'delete a project' do
    editor_sign_in

    # Given a project
    visit projects_path

    # When I click destroy
    page.find('#102197991').click_on 'Destroy'

    # Then I should no longer see the post
    page.text.wont_include 'magic'

  end
end
