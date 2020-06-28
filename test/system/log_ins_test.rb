require "application_system_test_case"

class LogInsTest < ApplicationSystemTestCase
  test 'sign up creates a User' do
    visit(new_user_path)

    fill_in 'user_email', with: 'epfl@epfl.ch'

    click_on 'Log in'

    assert_equal 1, User.all.length

    assert_equal 'epfl@epfl.ch', User.first.email
  end

  test "login doesn't create new user" do
    user = User.new
    user.email = 'other@epfl.ch'
    user.save!

    visit(new_user_path)

    fill_in 'user_email', with: user.email

    click_on 'Log in'

    assert_equal 1, User.all.length
  end
end
