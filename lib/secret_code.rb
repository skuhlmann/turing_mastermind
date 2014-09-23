class SecretCode
	attr_reader :secret_sequence

	def initialize
		@code_pool = ["r", "g", "b", "y"]
		@secret_sequence = (1..4).map { @code_pool.sample }
	end

end