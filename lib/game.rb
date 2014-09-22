class Game
	attr_reader :command, :printer, :target_sequence

	def initialize
		@command           = ""
		@printer           = MessagePrinter.new
		@target_sequence   = Target.new
		@guess             = ""
		@correct_colors    = 0
		@correct_positions = 0
	end

	def start
		puts "Welcome to MASTERMIND"
		puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
		until finished?
			@command = gets.strip
			process_initial_game_commands
		end
		puts "Thanks for playing MASTERMIND"
	end	

	private

	def process_initial_game_commands
		case
		when play?
			puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue and (y)ellow. Use (q)uit at any time to end the game."
			game_play
		when instructions?
			puts "TO DO: WRITE INSTRUCTIONS"
		else
			puts "Invalid command"
		end
	end

	def game_play
			puts "What's your guess:"
			until win? || exit?
				@command = gets.strip
				@guess = command.to_a
				compare_guess
			end
	end

	def compare_guess
		case
		when exit?
			puts "Exiting"
		when less_characters_than_target?
			puts "Your guess is too short! Try again."
		when more_characters_than_target?
			puts "Your guess is too long! Try again."
		when win?
			puts "Winnner"
		when wrong?
			puts "Wrong messages"
		end

		@guess = command.to_a
		guess.each_with_index 
				

				case
				end
	end

	def play?
		command == "p"
	end

	def instructions?
		command == "i"
	end

	def finished?
		command == "q" || command == "quit"
	end

	def win?
		guess == target_sequence

	def exit?
		command == "q" || command == "quit"
	end 

end