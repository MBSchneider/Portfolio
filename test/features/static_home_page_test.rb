require "test_helper"

class StaticHomePageTest < Capybara::Rails::TestCase
  test "sanity" do
    #visit root_path
    visit "/"
    assert_content page, "Welcome aboard"
    refute_content page, "Goodbye All!"
  end
end
