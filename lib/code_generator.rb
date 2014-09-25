class CodeGenerator
	attr_reader :difficulty

	def initialize(difficulty = "beginner")
		@difficulty = difficulty
		@beginner_pool = ["r", "g", "b", "y"]
		@intermediate_pool = ["r", "g", "b", "y", "o"]
		@advanced_pool = ["r", "g", "b", "y", "o", "p"]
	end

	def get_secret_code
		case
		when difficulty == "beginner"
			(1..4).map { @beginner_pool.sample }
		when difficulty == "intermediate"
			(1..5).map { @intermediate_pool.sample }
		when difficulty == "advanced"
			(1..8).map { @advanced_pool.sample }
		end
	end
end