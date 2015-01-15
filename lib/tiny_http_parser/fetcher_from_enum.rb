require_relative 'fetcher_base'

class FetcherFromEnum < FetcherBase

	def initialize enumerable
		@enumerable = enumerable.to_a
		@counter = 0
	end

	def parse_url
		return nil if @counter >= @enumerable.length
		result = @enumerable[@counter]
		@counter += 1
		result
	end

end