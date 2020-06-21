require "application_system_test_case"

class IdeasTest < ApplicationSystemTestCase

  test 'create new idea' do
    visit ('ideas/new')
    fill_in 'title', with: 'Visit the Hermitage Museum'
    fill_in 'done_count', with: 6164
    click_on 'Create idea'
    visit ('ideas/index')
    assert page.has_content?('Visit the Hermitage Museum')
  end

  test 'ideas are loaded in the index' do
    first_idea = Idea.new
    first_idea.title = 'Win the Lauberhorn downhill'
    first_idea.save!

    second_idea = Idea.new
    second_idea.title = 'Be a web developer'
    second_idea.save!

    visit ('ideas/index')
    assert page.has_content?('Win the Lauberhorn downhill')
    assert page.has_content?('Be a web developer')
  end
end
