gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/timer'

class TimerTest < Minitest::Test 
	def test_calculates_game_minutes_and_seconds
		timer = Timer.new
		timer.start
		timer.end

		assert_equal 0 , timer.game_minutes
		assert_equal 0 , timer.game_seconds
	end

	#this seems worthless

end
