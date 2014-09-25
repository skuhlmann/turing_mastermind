class Game
	attr_reader :command,
							:secret_code,
							:guess_checker,
							:guess_counter,
							:guess,
							:printer,
							:color_count,
							:exact_count,
							:difficulty,
							:timer

	def initialize(printer, difficulty = "beginner")
		@command        = ""
		@printer 			  = printer
		@guess_checker  = GuessChecker.new
		@secret_code 	  = CodeGenerator.new(difficulty).get_secret_code
		@guess_counter  = 0
		@difficulty		  = difficulty
		@timer          = Timer.new
	end

	def play
		printer.game_start(difficulty)
		timer.start
		until finished?
			printer.guess_prompt
			@command = gets.strip
			@guess = @command.split('')
			validate_input
		end
		printer.too_many_guesses if lose?
	end

	def validate_input
		case  
		when guess_checker.valid_length?(guess, secret_code)
			@guess_counter += 1
			compare_input
		when quit?
			printer.restart_game_instructions
		else
			printer.invalid_character_length
		end
	end

	def compare_input
		if guess_checker.win?(guess, secret_code)
			timer.end
      printer.win(secret_code, guess_counter, timer.game_minutes, timer.game_seconds)
    else
    	@color_count = 0
    	@exact_count = 0
    	#use local variables - not instance
    	give_guess_feedback
    end
	end

	def give_guess_feedback
		@color_count += guess_checker.color_matches(guess, secret_code)
    @exact_count += guess_checker.exact_matches(guess, secret_code)
   	printer.comparison_results(color_count, exact_count)
    printer.guess_number(guess_counter)
    #combine the 2 above
	end

	def win?
		guess_checker.win?(guess, secret_code)
	end

	def lose?
		@guess_counter == 10
	end

	def finished?
		quit? || win? || lose?
	end

	def quit?
		command == "q" || command == "quit"
	end
end
