require "application_system_test_case"

class ShowIdeasTest < ApplicationSystemTestCase

  test 'show displays title' do
    idea = Idea.new
    idea.title = 'Walking on a frozen lake'
    idea.save!

    visit(show_idea_path(idea))
    assert page.has_content?('Walking on a frozen lake')
  end
end
