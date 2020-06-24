require "application_system_test_case"

class IdeasTest < ApplicationSystemTestCase

  test 'create new idea' do
    visit (new_idea_path)
    fill_in 'title', with: 'Visit the Hermitage Museum'
    fill_in 'done_count', with: 6164
    click_on 'Create idea'
    assert page.has_content?('Visit the Hermitage Museum')
  end

  test 'ideas are loaded in the index' do
    first_idea = Idea.new
    first_idea.title = 'Win the Lauberhorn downhill'
    first_idea.save!

    second_idea = Idea.new
    second_idea.title = 'Be a web developer'
    second_idea.save!

    visit (ideas_path)
    assert page.has_content?('Win the Lauberhorn downhill')
    assert page.has_content?('Be a web developer')
  end

  test 'edit idea' do
    idea = Idea.new
    idea.save!

    visit(edit_idea_path(idea))

    fill_in('Done count', with: 777)
    fill_in('Title', with: 'Edit Test Title')

    click_on 'Update'

    click_on('Edit Test Title')

    assert page.has_content?('Edit Test Title')

    assert page.has_content?('777 have done this')
  end

  test 'search' do
    first_idea = Idea.new
    first_idea.title = 'Climb Mont Blanc'
    first_idea.save!

    second_idea = Idea.new
    second_idea.title = 'Visit Niagara Falls'
    second_idea.save!

    visit (root_path)

    fill_in('q', with: 'Mont')
    click_on('Search', match: :first)

    assert current_path.include?(ideas_path)

    assert page.has_content?('Climb Mont Blanc')

    refute page.has_content?('Visit Niagara Falls')
  end

  test 'no ideas found' do
    visit (ideas_path)
    fill_in('q', with: 'zzz')
    click_on('Search', match: :first)
    assert page.has_content?('No ideas found !')
  end

  test 'for matching title and/or description' do
    idea_1 = Idea.new
    idea_1.title = 'Go cycling across Europe'
    idea_1.description = 'An amazing way to see lots of Europe'
    idea_1.save!
    idea_2 = Idea.new
    idea_2.title = 'Visit Provence'
    idea_2.description = 'Go to vineyards, go cycling up Mont Ventoux, see the fileds of lavander'
    idea_2.save!
    idea_3 = Idea.new
    idea_3.title = 'Overnight hike in Switzerland'
    idea_3.description = 'Stay in a Swiss refuge in the mountains'
    idea_3.save!

    visit(root_path)

    fill_in('q', with: 'cycling')
    click_on('Search', match: :first)

    assert page.has_content?('Go cycling across Europe')

    assert page.has_content?('Visit Provence')

    refute page.has_content?('Overnight hike in Switzerland')
  end
end
