require "application_system_test_case"

class LogInsTest < ApplicationSystemTestCase
  test 'sign up creates a User' do
    visit(new_user_path)

    fill_in 'user_email', with: 'epfl@epfl.ch'

    click_on 'Log in'

    assert_equal 1, User.all.length

    assert_equal 'epfl@epfl.ch', User.first.email
  end
end
