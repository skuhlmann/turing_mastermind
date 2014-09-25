gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game'
require_relative '../lib/message_printer'
require_relative '../lib/guess_checker'
require_relative '../lib/code_generator'

class GameTest < Minitest::Test

	def test_starts_an_intermediate_game
		difficulty = "intermediate"
		printer = MessagePrinter.new
		game = Game.new(printer, difficulty)

		assert_equal 5, game.secret_code.length
	end

	def test_starts_an_advanced_game
		difficulty = "advanced"
		printer = MessagePrinter.new
		game = Game.new(printer, difficulty)

		assert_equal 8, game.secret_code.length
	end

	def test_can_exit_to_cli_start_loop_with_q_inside_game_loop
		skip
		printer = MessagePrinter.new
		game = Game.new(printer, difficulty)
		game.play
  	#hmmmm
	end

	def test_will_quit_to_cli_play_loop_when_over_10_guesses
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