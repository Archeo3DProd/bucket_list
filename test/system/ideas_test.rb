require "application_system_test_case"

class IdeasTest < ApplicationSystemTestCase

  test 'create new idea' do

    visit ('ideas/new')
    fill_in 'title', with: 'Visit the Hermitage Museum'
    fill_in 'done_count', with: 6164
    click_on 'Create idea'
    visit ('account/ideas')
    assert page.has_content?('Visit the Hermitage Museum')
    sleep(3.seconds)

  end

end
