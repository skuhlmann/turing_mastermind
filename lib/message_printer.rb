class MessagePrinter
  def introduction
		puts "Welcome to MASTERMIND"
    program_instructions
  end

	def program_instructions
		puts "Would you like to (p)lay, read the (i)nstructions or (q)uit?"
	end

	def game_start
		puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue and (y)ellow. Enter a combination of those colors to try and crack my code. Use (q)uit at any time to end the game."
		guess_prompt
	end

	def guess_prompt
		printf "What's your guess? "
	end

	def instructions
		puts "The object of MASTERMIND is to guess a secret combination of colors in a specific order. The computer mastermind will create this secret code and you will be prompted to enter your guess in the form of letters (ex: 'r' for red, 'b' for blue). Each time you submit a guess the mastermind will let you know how close you are. Use (q)uit at any time to end the game."
	end

	def exit
		puts "Thanks for playing."
	end

	def invalid_command
		puts "The command was invalid."
	end

	def invalid_character_length
		puts "Your guess should be 4 letters long."
	end

	def win(secrect_code, guess_counter, game_minutes, game_seconds)
		puts "Congratulations, you've cracked the code #{secrect_code} in #{guess_counter} guesses in #{game_minutes} minutes and #{game_seconds} seconds."
		restart_game_instructions
	end

	def too_many_guesses
		puts "Yout couldn't crack the code in 10 guesses."
		restart_game_instructions
	end

	def restart_game_instructions
		puts "Would you like to (p)lay again or (q)uit?"
	end

	def comparison_results(color_count, position_count)
		puts "Correct colors: #{color_count}. Correct position: #{position_count}"
	end

	def guess_number(guess_counter)
		puts "You've taken #{guess_counter} guesses."
	end
end