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

  test 'updated_at is changed after updating done_count' do
    idea = Idea.new
    idea.done_count = 216
    idea.save!
    first_updated_at = idea.updated_at
    idea.done_count = 95164
    idea.save!
    refute_equal(idea.updated_at, first_updated_at)
  end

  test 'updated_at is changed after updating photo_url' do
    idea = Idea.new
    idea.photo_url = '/images/swimmers.jpg'
    idea.save!
    first_updated_at = idea.updated_at
    idea.photo_url = '/images/runners.jpg'
    idea.save!
    refute_equal(idea.updated_at, first_updated_at)
  end

  test 'one matching result' do
    idea = Idea.new
    idea.title = 'First title'
    idea.save!
    assert_equal Idea.search('title').length, 1
  end

  test 'No matching result' do
    idea = Idea.new
    idea.title = 'First title'
    idea.save!
    assert_empty Idea.search('football')
  end

  test 'two matching results' do
    first_idea = Idea.new
    first_idea.title = 'First title'
    first_idea.save!
    second_idea = Idea.new
    second_idea.title = 'Second title'
    second_idea.save!

    assert_equal Idea.search('title').length, 2
  end
end
