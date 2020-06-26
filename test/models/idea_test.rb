require 'test_helper'

class IdeaTest < ActiveSupport::TestCase

  test 'the first Idea created is first on the list' do
    first_idea = Idea.new
    first_idea.title = 'Title'
    first_idea.save!
    second_idea = Idea.new
    second_idea.title = 'Title'
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
    idea.title = 'Title'
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
    idea.title = 'Title'
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

  test 'most_recent, no ideas' do
    assert_empty Idea.most_recent()
  end

  test 'most_recent, two ideas' do
    first_idea = Idea.new
    first_idea.title = 'First idea title'
    first_idea.save!
    second_idea = Idea.new
    second_idea.title = 'Second idea title'
    second_idea.save!

    assert_equal Idea.most_recent.length, 2
    assert_equal Idea.most_recent.first, second_idea
  end

  test 'most_recent, six ideas' do
    6.times do |i|
      idea = Idea.new
      idea.title = "Idea title #{i+1}"
      idea.save!
    end
    assert_equal Idea.most_recent.length, 3
    assert_equal Idea.most_recent.first.title, 'Idea title 6'
  end

  test 'only description match' do
    idea = Idea.new
    idea.title = 'Surfing in Portugal'
    idea.description = 'See what Atlantic coast waves are like!'
    idea.save!
    assert_equal Idea.search('coast').length, 1
  end

  test 'description and title match' do
    idea_1 = Idea.new
    idea_1.title = 'Overnight hike in Switzerland'
    idea_1.description = 'Stay in a Swiss refuge in the mountains'
    idea_1.save!
    idea_2 = Idea.new
    idea_2.title = 'Hike the mountains in Italy'
    idea_2.description = 'See the Dolomites and Italian Alps'
    idea_2.save!
    assert_equal Idea.search('mountains').length, 2
  end

  test 'maximum title length' do
    idea = Idea.new
    idea.title = '1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890 1234567890'
    idea.save
    assert idea.invalid?
  end

  test 'title presence' do
    idea = Idea.new
    idea.save
    assert idea.invalid?
  end
end
