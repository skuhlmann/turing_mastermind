class Game
  attr_reader :printer,
              :guess,
              :secret_code,
              :guess_counter,
              :position_count,
              :color_count,
              :command,
              :start_time,
              :end_time,
              :game_time

  def initialize(printer = MessagePrinter.new)
    @printer                = printer
    @guess                  = ""
    @secret_code            = SecretCode.new.generate_code
    @guess_counter          = 1
    @command                = ""
  end

  def play
    @start_time = Time.new
    printer.game_start
    guess_loop
  end

  def guess_loop
    until finished?
      take_guess
      check_valid_guess
    end
  end

  def check_guess_counter
    printer.too_many_guesses if guess_limit?

  end

  def take_guess
    @command = gets.strip 
    @guess = @command.scan(/./)
  end

  def check_valid_guess
    case 
    when exit?
      end_game
    when input_is_too_long
      printer.invalid_character_length
    when input_is_too_short
        printer.invalid_character_length
    else
      compare_guess
      @guess_counter += 1
    end
  end

  def compare_guess
    case
    when win?
      @end_time = Time.new
      printer.win(secret_code, guess_counter, game_minutes, game_seconds)
    when wrong?
      comparison
      printer.comparison_results(position_count, color_count)
      printer.guess_number(guess_counter)
     end 
  end

  def comparison
    @position_count = 0
    @color_count    = 0
    compare_colors
    compare_positions
  end

  def compare_colors
    similar_colors = secret_code.zip(guess).map { |code_color, guess_color| code_color == guess_color }
    @color_count += similar_colors.count(true)
  end

  def compare_positions
    secret_code_copy = secret_code.dup
    position_matches = guess.each do |element|
      if secret_code_copy.include?(element)
        @position_count += 1
        secret_code_copy.slice!(secret_code_copy.index(element))
      end
    end
  end

  def finished?
    exit? || guess_limit? || win?  ### this isn't working for guess limit
  end

  def check_guess_counter
    printer.too_many_guesses if guess_limit?
  end

  def exit?
    command == "q" || command == "quit"
  end

  def win?
    guess == secret_code
  end

  def guess_limit?
    guess_counter > 10
  end

  def end_game
    printer.restart_game_instructions
  end

  def input_is_too_long
    command.length > 4
  end

  def input_is_too_short
    command.length < 4
  end

  def wrong?
    guess != secret_code
  end

  def game_minutes
    (end_time - start_time).to_i / 60
  end

  def game_seconds
    (end_time - start_time).to_i % 60
  end
end
