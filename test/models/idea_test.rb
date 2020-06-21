require 'test_helper'

class IdeaTest < ActiveSupport::TestCase

  test 'the first Idea created is first on the list' do
    first_idea = Idea.new
    first_idea.save!
    second_idea = Idea.new
    second_idea.save!
    assert_equal(first_idea, Idea.all.first)
  end

  test 'the first complete Idea created is first on the list' do
    first_idea = Idea.new
    first_idea.title = 'Cycle the length of the United Kingdom'
    first_idea.photo_url = 'http://mybucketlist.ch/an_image.jpg'
    first_idea.done_count = 12
    first_idea.save!
    second_idea = Idea.new
    second_idea.title = 'Visit Japan'
    second_idea.photo_url = 'http://mybucketlist.ch/second_image.jpg'
    second_idea.done_count = 3
    second_idea.save!
    assert_equal(first_idea, Idea.all.first)
  end

  test 'updated_at is changed after updating title' do
    idea = Idea.new
    idea.title = 'Visit London'
    idea.save!
    first_updated_at = idea.updated_at
    idea.title = 'Visit Glasgow'
    idea.save!
    refute_equal(idea.updated_at, first_updated_at)
  end
end
