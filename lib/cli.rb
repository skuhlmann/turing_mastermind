class CLI
	attr_reader :command, :printer, :difficulty

	def initialize
		@command = ""
		@printer = MessagePrinter.new
		@difficulty = ""
	end

	def start
		printer.introduction
		until quit?
			@command = gets.strip
			process_program_instructions
		end
	end

	def process_program_instructions
		case
		when quit?
			printer.quit
		when instructions?
			printer.instructions
		when play_beginner?
			@difficulty = "beginner"
			game = Game.new(printer, difficulty)
			game.play
		when play_intermediate?
			@difficulty = "intermediate"
			game = Game.new(printer, difficulty)
			game.play
		when play_advanced?
			@difficulty = "advanced"
			game = Game.new(printer, difficulty)
			game.play
		else
			printer.invalid_command
		end
	end

	def quit?
		 command == "q" || command == "quit"
	end

	def instructions?
		command == "i"		
	end

	def play_beginner?
		command == "b"
	end

	def play_intermediate?
		command == "n"
	end

	def play_advanced?
		command == "a"
	end

end