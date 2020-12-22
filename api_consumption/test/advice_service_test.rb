require 'minitest/autorun'
require 'minitest/pride'
require'./api_consumption/lib/advice_service'

class TestAdvice < Minitest::Test
  def setup
    @a = AdviceService.new
  end

  def test_that_it_exists
    assert_equal @a.class, AdviceService
  end

  def test_can_find_advice
    random = @a.random

    assert random.key?('slip')
    assert random['slip'].key?('id')
    assert random['slip'].key?('advice')
  end

  def test_can_find_advice_by_search_term
    advice = @a.search('happiness')

    assert_equal advice.key?('total_results'), true
    assert_equal advice.key?('query'), true
    assert_equal advice.key?('slips'), true
    assert advice['slips'][0].key?('id')
    assert advice['slips'][0].key?('advice')
  end

end
