class CLI
	attr_reader :command, :printer

	def initialize
		@command = ""
		@printer = MessagePrinter.new
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
		when play?
			game = Game.new(printer)
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

	def play?
		command == "p"
	end
end