gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/cli'
require '../lib/game'

class GameTest < Minitest::Test

	def test_will_quit_to_cli_play_loop_when_over_10_guesses
		skip
	end

	def test_can_exit_to_cli_start_loop_with_q_inside_game_loop
		skip
	end


	##This game stuff is so much easier to test while running the program
	def test_will_not_accept_invalid_input
		skip
	end

	def test_keeps_track_of_guesses
		skip
	end



end