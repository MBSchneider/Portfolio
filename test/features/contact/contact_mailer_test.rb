require 'test_helper'

feature 'Send contact me email' do
  scenario 'sends email with contact information' do
    visit root_path

    click_link 'Contact'

    fill_in 'Name', with: 'Sam'
    fill_in 'Email', with: 'sam@sam.com'
    fill_in 'contact[content]', with: 'a to z'
    click_button 'Send Message!'

    a = ActionMailer::Base.deliveries[0]

    a['to'].to_s.must_include('matts3@u.washington.edu')
    a['from'].to_s.must_include(ENV['USER_NAME'])
    a.to_s.must_include('a to z')
    a['subject'].to_s.must_include('matt-schneider.com Contact Message')
  end
end
