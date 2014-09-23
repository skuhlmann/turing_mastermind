class SecretCode

	def initialize
		@code_pool = ["r", "g", "b", "y"]
	end

	def generate_code
		(1..4).map { @code_pool.sample }
	end
end
