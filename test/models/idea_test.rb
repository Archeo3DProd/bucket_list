require 'test_helper'

class IdeaTest < ActiveSupport::TestCase

  test 'changing the title' do
    idea = Idea.new
    idea.title = 'Test Title'
    idea.save!

    updated_at = idea.updated_at

    idea.title = 'Second Title'

    assert idea.save
    refute_equal idea.updated_at, updated_at
  end

  test 'removing the title' do
    idea = Idea.new
    idea.title = 'Test Title'
    idea.save!

    updated_at = idea.updated_at

    idea.title = ''

    assert idea.save
    refute_equal idea.updated_at, updated_at
  end
end
