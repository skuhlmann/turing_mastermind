require 'rainbow'

class MessagePrinter
  def introduction
		puts Rainbow("MM    MM   AAA    SSSSS  TTTTTTT EEEEEEE RRRRRR  MM    MM IIIII NN   NN DDDDD   
MMM  MMM  AAAAA  SS        TTT   EE      RR   RR MMM  MMM  III  NNN  NN DD  DD  
MM MM MM AA   AA  SSSSS    TTT   EEEEE   RRRRRR  MM MM MM  III  NN N NN DD   DD 
MM    MM AAAAAAA      SS   TTT   EE      RR  RR  MM    MM  III  NN  NNN DD   DD 
MM    MM AA   AA  SSSSS    TTT   EEEEEEE RR   RR MM    MM IIIII NN   NN DDDDDD").red
		program_instructions
  end

	def program_instructions
		puts "\nWould you like to:
		\r-play a (b)eginner game
		\r-i(n)termediate game
		\r-(a)dvanced game
		\r-read the (i)nstructions
		\r-or (q)uit?"
	end

	def difficulty_prompt
		puts "\n Would you like a (b)eginner, (i)ntermediate, or (a)davanced game?"
	end

	def game_start(difficulty)
		case 
		when difficulty == "beginner"
			puts "\nI have generated a beginner sequence with four elements made up of: 
			\r(r)ed, (g)reen, (b)lue and (y)ellow. Enter a combination of those colors 
			\rto try and crack my code, by entering a combination of r,g,b and y.
			\rUse (q)uit at any time to end the game."
		when difficulty == "intermediate"
			puts "\nI have generated an intermediate sequence with five elements made up of: 
			\r(r)ed, (g)reen, (b)lue, (y)ellow and (o)range. Enter a combination of those colors 
			\rto try and crack my code, by entering a combination of r,g,b and y.
			\rUse (q)uit at any time to end the game."
		when difficulty == "advanced"
			puts "\nI have generated an advanced sequence with eight elements made up of: 
			\r(r)ed, (g)reen, (b)lue,(y)ellow, (o)range and (p)ink. Enter a combination of those colors 
			\rto try and crack my code, by entering a combination of r,g,b and y.
			\rUse (q)uit at any time to end the game."
		end
	end

	def guess_prompt
		printf "\nWhat's your guess? "
	end

	def instructions
		puts "The object of MASTERMIND is to guess a secret combination of colors in a specific order. 
		\rThe computer mastermind will create this secret code and you will be prompted to enter your 
		\rguess:
		\r- Only use lowercase letters (ex: 'r' for red, 'b' for blue). 
		\r- Use (q)uit at any time to end the game."
		program_instructions
	end

	def quit
		puts "Thanks for playing."
	end

	def invalid_command
		puts "The command was invalid."
	end

	def invalid_character_length
		puts "Your guess should be 4 letters long."
	end

	def win(secret_code, guess_counter, game_minutes, game_seconds)
		puts Rainbow("Congratulations").red.bright + ", you've cracked the code. 
		\rIt took #{guess_counter} guesses in #{game_minutes} minutes and #{game_seconds} seconds."
		restart_game_instructions
	end

	def too_many_guesses
		puts "Yout couldn't crack the code in 10 guesses."
		restart_game_instructions
	end

	def restart_game_instructions
		puts "Would you like to (p)lay again or (q)uit?"
	end

	def comparison_results(color_count, exact_count)
		puts "Correct colors: #{color_count}. Correct position: #{exact_count}"
	end

	def guess_number(guess_counter)
		puts "You've taken #{guess_counter} guesses."
	end
end