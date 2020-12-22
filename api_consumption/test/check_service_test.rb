require 'minitest/autorun'
require 'minitest/pride'
require'./api_consumption/lib/chuck_service'

class TestChuckService < Minitest::Test
  def setup
    @c = ChuckService.new
  end

  def test_that_it_exists
    assert_equal @c.class, ChuckService
  end

  def test_can_find_random_chuck_norris_joke
    joke = @c.random

    assert_equal joke.key?('icon_url'), true
    assert_equal joke.key?('id'), true
    assert_equal joke.key?('value'), true
  end

  def test_random_in_category
    joke = @c.random_in_category('music')

    assert_equal (joke).key?('categories'), true
    assert_equal (joke).key?('icon_url'), true
    assert_equal (joke).key?('id'), true
    assert_equal (joke).key?('value'), true
    refute joke.key?('apple')
  end

  def test_can_find_list_of_categories
    categories = @c.categories

    assert_includes categories, 'music'
    assert_includes categories, 'science'
    assert_includes categories, 'fashion'
    assert_includes categories, 'money'
    assert_includes categories, 'career'
  end

  def test_search_for_a_joke
    results = @c.search('snakes')

    assert_equal results.key?('total'), true
    assert_equal results.key?('result'), true
    assert_equal results['result'][0].key?('categories'), true
    assert_equal results['result'][0].key?('icon_url'), true
    assert_equal results['result'][0].key?('id'), true
    assert_equal results['result'][0].key?('value'), true
  end
end
