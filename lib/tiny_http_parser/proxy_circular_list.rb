class ProxyCircularList
	def initialize proxy_enum
		@proxy_enum = proxy_enum.to_a
		@counter = 0
	end

	def fetch
		raise 'empty proxy list given' if @proxy_enum.length == 0
		@counter = 0 if @counter >= @proxy_enum.length
		result = @proxy_enum[@counter]
		@counter +=1
		puts result
		result
	end

	def to_proc
		Proc.new { fetch }
	end
end