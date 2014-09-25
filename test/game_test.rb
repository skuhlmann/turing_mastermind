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

	def test_plays_until_quit
		skip
	end

	def test_plays_until_loses
		skip
	end

	def test_plays_until_wins
		skip
	end

	def test_color_counter
		skip
	end

	def test_exact_counter
		skip
	end

	def test_tracks_game_time
		skip
	end


end