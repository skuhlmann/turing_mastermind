class Timer
	attr_reader :start_time
							:end_time

	def initialize
		@start_time = ""
		@end_time   = ""
	end

	def start
		@start_time = Time.new
	end

	def end
		@end_time = Time.new
	end

	def game_minutes
    (@end_time - @start_time).to_i / 60
  end

  def game_seconds
    (@end_time - @start_time).to_i % 60
  end
end