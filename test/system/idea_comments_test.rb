require "application_system_test_case"

class IdeaCommentsTest < ApplicationSystemTestCase
  test 'adding a Comment to an Idea' do
    idea = Idea.new title: 'Adding comment test'
    idea.save!

    visit(idea_path(idea))

    fill_in 'Add a comment', with: 'This is a comment'

    click_on('Post', match: :first)

    assert current_path.include?(ideas_path)
  end
end
