require_relative 'fetcher_base'

class FetcherFromEnum < FetcherBase

	def initialize enumerable
		@data =  RepeatableElement.new enumerable
	end

	def parse_url
		return nil if item = @data.next
		item
	end

end