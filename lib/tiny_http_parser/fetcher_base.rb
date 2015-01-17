# require 'httpclient'
require 'faraday'
class FetcherBase

	def initialize
		raise 'abstract class'
	end

	def set_proxy &block
		@proxy_block = block if block_given?
	end

	def proxy_set?
		@proxy_block != nil
	end

	def get_proxy
		@proxy_block.call
	end

	def parse_url
		raise 'abstract method called exception'
	end

	def on_action &block
		@on_action = block if block_given?
	end

	def configure &block
		@configure_block = block if block_given?
	end

	def on_exception_raised &block
		@exception_raised_block = block if block_given?
	end

	def perform
		before_start if defined? before_start
		raise 'no on_action block given' unless @on_action
		http_client = Faraday.new
		while true do
			url = parse_url
			break unless url
			begin
				@on_action.call url, http_client
			rescue Exception => e
				@exception_raised_block.call(e,url,http_client) if @exception_raised_block
			end
	end
	end
end