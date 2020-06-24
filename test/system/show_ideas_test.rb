require "application_system_test_case"

class ShowIdeasTest < ApplicationSystemTestCase

  test 'show displays title' do
    idea = Idea.new
    idea.title = 'Walking on a frozen lake'
    idea.done_count = 216
    idea.save!

    visit(idea_path(idea))
    assert page.has_content?('Walking on a frozen lake')
    assert page.has_content?('216 have done')
    assert page.has_content?(idea.created_at.strftime("%d %b '%y"))

    click_on('Edit')

    assert_equal current_path, edit_idea_path(idea)
  end
end
