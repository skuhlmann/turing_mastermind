gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/cli.rb'
require ''

class GameTest < Minitest::Test

	def test_compares_guesses
		Game.new.start

		
	end
end