require "application_system_test_case"

class IdeaCommentsTest < ApplicationSystemTestCase
  test 'adding a Comment to an Idea' do
    idea = Idea.new title: 'Adding comment test'
    idea.save!

    visit(idea_path(idea))

    fill_in 'Add a comment', with: 'This is a comment'
        sleep 8

    click_on('Post', match: :first)

    assert current_path.include?(ideas_path)

    sleep 8

    assert page.has_content?('This is a comment')
  end
end
