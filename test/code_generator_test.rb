gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/code_generator'

class CodeGeneratorTest < Minitest::Test

	def test_generates_a_beginner_code
		code = CodeGenerator.new
		secret_code = code.get_secret_code

		assert_equal 4, secret_code.length
	end

	def test_generates_a_intermediate_code
		code = CodeGenerator.new("intermediate")
		secret_code = code.get_secret_code

		assert_equal 5, secret_code.length
	end

	def test_generates_an_advanced_code
		code = CodeGenerator.new("advanced")
		secret_code = code.get_secret_code

		assert_equal 8, secret_code.length
	end

end
