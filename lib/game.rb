class Game
  attr_reader :command
              :guess
              :secret_sequence

  def initialize
    @command         = ""
    @guess           = ""
    @secret_code     = []
  end

  def start
    puts "Welcome to MASTERMIND"
    until exit?
      puts "(p)lay starts a game\n(q)uit ends a game\n(i)nstructions gives you instructions."
      @command = gets.strip
      process_initial_commands
    end
  end

  private

  def process_initial_commands
    case
    when play?
      puts "Game start message"
      @secret_code = ["r", "g", "b", "y"]
      guess_loop
    when instructions?
      puts "Instructions:"
    when exit?
      puts "Thanks for playing."
    else
      puts "The command was invalid."
    end
  end

  def guess_loop
    @guess_counter = 0
    until exit? || win?
      printf "Make a guess: "
      @command = gets.strip
      @guess = @command.scan(/./)
      case 
      when input_is_too_long
        puts "guess should be 4 letters long"
      when input_is_too_short
        puts "guess should be 4 letters long"
      else
        compare_guess
        @guess_counter += 1
      end
    end
  end

  def compare_guess
    case
    when win?
      puts "YOU WIN!"
    when wrong?
      comparison
      puts "you had #{@correct_color_count} correct colors in #{@correct_position_count} correct positions"
    end
  end

  def comparison
    @correct_position_count = 0
    @correct_color_count = 0
    @guess.length.times do |iteration|
      if @guess[iteration - 1] == @secret_code[iteration - 1]
        @correct_position_count += 1
      end
    end
    color_matches = @secret_code.find_all { |letter| @guess.include?(letter) }
    @correct_color_count += color_matches.length
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

  def win?
    @guess == @secret_code
  end

  def input_is_too_long
    @guess.length > 4
  end

  def input_is_too_short
    @guess.length < 4
  end

  def wrong?
    @guess != @secret_code
  end

end

