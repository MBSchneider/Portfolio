ENV['RAILS_ENV'] = 'test'
require 'simplecov'
SimpleCov.start
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'minitest/pride'

Turn.config.format = :outline

# Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical
# order.
class ActiveSupport::TestCase
  fixtures :all
end

# Setup dependencies
class ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  include Capybara::DSL
end

def editor_sign_in
  visit new_user_session_path
  fill_in 'Email', with: users(:one).email
  fill_in 'Password', with: 'password'
  click_on 'Sign in'
end

def author_sign_in
  visit new_user_session_path
  fill_in 'Email', with: users(:two).email
  fill_in 'Password', with: 'passwordtwo'
  click_on 'Sign in'
end

def reg_sign_in
  visit new_user_session_path
  fill_in 'Email', with: users(:three).email
  fill_in 'Password', with: 'passwordthree'
  click_on 'Sign in'
end
