class Target
	attr_reader :sequence

	def initialize
		@sequence = ["R", "G", "B", "Y"].shuffle!
	end

end