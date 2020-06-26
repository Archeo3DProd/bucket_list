require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'changing the associated Idea for a Comment' do
    first_idea = Idea.new
    first_idea.title = 'Changing the associated Idea for a Comment'
    first_idea.save!

    comment = Comment.new(body: "I'd like to do this!", idea: first_idea)
    comment.save!

    second_idea = Idea.new
    second_idea.title = 'New title for a new idea'
    second_idea.save!

    comment.idea = second_idea
    comment.save!

    assert_equal second_idea, Comment.first.idea
  end
end
