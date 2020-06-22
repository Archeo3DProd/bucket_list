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

  test 'edit idea' do
    idea = Idea.new
    idea.save!

    visit(edit_idea_path(idea))

    fill_in('done_count', with: 777)
    fill_in('title', with: 'Edit Test Title')

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

    assert current_path.include?(ideas_index_path)

    assert page.has_content?('Climb Mont Blanc')

    refute page.has_content?('Visit Niagara Falls')
  end

  test 'no ideas found' do
    visit (root_path)
    fill_in('q', with: 'zzz')
    click_on('Search', match: :first)
    assert page.has_content?('No ideas found !')
  end
end
