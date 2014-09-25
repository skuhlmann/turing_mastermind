class Game
	attr_reader :command,
							:secret_code,
							:guess_checker,
							:start_time,
							:guess_counter,
							:guess,
							:printer,
							:color_count,
							:exact_count

	def initialize(printer)
		@command        = ""
		@printer 			  = printer
		@guess_checker  = GuessChecker.new
		@secret_code 	  = CodeGenerator.new.get_secret_code
		@start_time     = Time.new
		@guess_counter  = 0
		@guess          = ""
	end

	def play
		printer.game_start
		until finished?
			printer.guess_prompt
			@command = gets.strip
			@guess = @command.split('')
			validate_input
		end
	end

	def validate_input
		if guess_checker.valid_length?(guess, secret_code)
			@guess_counter += 1
			compare_input
		else
			printer.invalid_character_length
		end
	end

	def compare_input
		if guess_checker.win?(guess, secret_code)
			@end_time = Time.new
      printer.win(secret_code, guess_counter, game_minutes, game_seconds)
    else
    	@color_count = 0
    	@exact_count = 0
    	give_guess_feedback
    end
	end

	def give_guess_feedback
		@color_count += guess_checker.color_matches(guess, secret_code)
    @exact_count += guess_checker.exact_matches(guess, secret_code)
   	printer.comparison_results(color_count, exact_count)
    printer.guess_number(guess_counter)
	end

	def win?
		guess_checker.win?(guess, secret_code)
	end

	def lose?
		@guess_counter == 10
	end

	def game_minutes
    (@end_time - @start_time).to_i / 60
  end

  def game_seconds
    (@end_time - @start_time).to_i % 60
  end

	def finished?
		quit? || win? || lose?
	end

	def quit?
		command == "q" || command == "quit"
	end
end
