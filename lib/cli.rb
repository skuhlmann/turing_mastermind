class CLI
  attr_reader :command, :printer

  def initialize
    @command = ""
    @printer = MessagePrinter.new
  end

  def start
    printer.introduction
    until exit?
      @command = gets.strip
      process_initial_commands
    end
  end

  def process_initial_commands
    case
    when play?
      game = Game.new(printer)
      game.play
    when instructions?
      printer.instructions
    when exit?
      printer.exit
    else
      printer.invalid_command
    end
  end

  def play?
    command == "p"
  end

  def instructions?
    command == "i"
  end

  def exit?
    command == "q" || command == "quit"
  end


end

