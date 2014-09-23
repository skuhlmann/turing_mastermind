class Game
  attr_reader :printer,
              :guess,
              :secret_code,
              :guess_counter,
              :position_count,
              :color_count,
              :command,
              :start_time,
              :win_time,
              :game_time

  def initialize(printer = MessagePrinter.new)
    @printer                = printer
    @guess                  = ""
    @secret_code            = SecretCode.new.generate_code
    @guess_counter          = 1
    @command                = ""
  end

  def play
      printer.game_start
    until exit? || win?
      @start_time = Time.new
      @command = gets.strip 
      @guess = @command.scan(/./)
      case 
      when input_is_too_long
        printer.invalid_character_length
      when input_is_too_short
        printer.invalid_character_length
      else
        compare_guess
        @guess_counter += 1
      end
    end
  end

  def compare_guess
    case
    when win?
      @win_time = Time.new
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

    similar_positions = secret_code.zip(guess).map { |code_letter, guess_letter| code_letter == guess_letter }
    @color_count += similar_positions.count(true)

    secret_code_copy = secret_code.map { |color| color }
    color_matches = guess.each do |color|
      if secret_code_copy.include?(color)
        @position_count += 1
        secret_code_copy.slice!(secret_code_copy.index(color))
      end
    end
  end

  def exit?
    command == "q" || command == "quit"
  end

  def win?
    guess == secret_code
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
    (win_time - start_time).to_i / 60
  end

  def game_seconds
    (win_time - start_time).to_i % 60
  end
end
