require 'httpclient'
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

	def on_content_get &block
		@content_block = block if block_given?
	end

	def configure &block
		@configure_block = block if block_given?
	end

	def on_exception_raised &block
		@exception_raised_block = block if block_given?
	end

	def perform
		before_start if defined? before_start
		raise 'no on_content_get block given' unless @content_block
		http_client = HTTPClient.new
		http_client = HTTPClient.new(get_proxy) if proxy_set?
		while true do
			url = parse_url
			break unless url
			content_block.call(http_client) if @configure_block
			begin
				content = http_client.get_content url
			rescue Exception => e
				@exception_raised_block.call(e,url,http_client) if @exception_raised_block
			else
				@content_block.call url, content, http_client
			end
			http_client = HTTPClient.new(get_proxy) if proxy_set?
	end
	end
end