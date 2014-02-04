require 'test_helper'

feature 'Delete a post w fixtures' do
  scenario 'select delete on a valid post' do

    editor_sign_in

    # Navigate to index
    visit posts_path

    # When destroy is clicked
    page.find('#post_1002452156').click_button 'Destroy'

    # Message should no longer show
    page.wont_have_content 'We are young.'
  end
end
