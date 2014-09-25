gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess_checker'

class GuessCheckerTest < Minitest::Test

	def test_validates_the_number_of_letters
		guess = ["g", "r", "g"]
		secret_code 	= ["b", "r", "r", "y"]

		guess_checker = GuessChecker.new

		refute guess_checker.valid_length?(guess, secret_code)
	end

	def test_valid_guess_inputs
		guess = ["h", "g", "g", "g"]
		guess_2 = ["g", "g", "g", "g"]
		secret_code 	= ["b", "y", "r", "g"]

		guess_checker = GuessChecker.new

		refute guess_checker.valid_input?(guess, secret_code)
		assert guess_checker.valid_input?(guess_2, secret_code)
	end

	def test_returns_win
		guess 				= ["b", "y", "r", "g"]
		secret_code 	= ["b", "y", "r", "g"]

		guess_checker = GuessChecker.new

		assert_equal true, guess_checker.win?(guess, secret_code)
	end

	def test_returns_number_of_exact_matches
		guess 				= ["b", "g", "r", "g"]
		secret_code 	= ["b", "r", "r", "y"]

		guess_checker = GuessChecker.new
		exacts = guess_checker.exact_matches(guess, secret_code)

		assert_equal 2, exacts
	end

	def test_returns_number_of_matching_colors
		guess 				= ["b", "y", "r", "g"]
		secret_code 	= ["b", "g", "r", "r"]

		guess_checker = GuessChecker.new
		colors = guess_checker.color_matches(guess, secret_code)

		assert_equal 3, colors
	end

	def test_returns_number_of_matching_colors
		guess 				= ["b", "y", "r", "g"]
		secret_code 	= ["g", "g", "r", "r"]

		guess_checker = GuessChecker.new
		colors = guess_checker.color_matches(guess, secret_code)

		assert_equal 2, colors
	end

	def test_returns_number_of_matching_colors_with_no_duplicate
		guess 				= ["y", "b", "g", "r"]
		secret_code 	= ["b", "g", "y", "r"]

		guess_checker = GuessChecker.new
		colors = guess_checker.color_matches(guess, secret_code)

		assert_equal 4, colors
	end

end