class GuessChecker
	def initialize
	end

	def valid?(guess, secret_code)
		secret_code.count == guess.count && guess.all? { |color| "rgbyop".include?(color) }
	end

	def valid_input?(guess, secret_code)
		guess.all? { |color| "rgbyop".include?(color) }
	end

	def win?(guess, secret_code)
		guess == secret_code
	end

	def exact_matches(guess, secret_code)
		guess.each_with_index.count do |color, index|
			secret_code[index] == color
		end
	end

	def color_matches(guess, secret_code)
		secret_code_copy = secret_code.dup
		guess.each.count do |color|
			if secret_code_copy.include?(color)
			secret_code_copy.slice!(secret_code_copy.index(color))
			end
		end	
	end
end
