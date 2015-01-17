class RepeatableElement

	@max_get = 3

	def initialize elements
		@elements = elements.map {|e| [e, 0] }
		@index
	end

	def next
		reorganize_elements if @index >= @element.length
		return nil if @elements.length == 0
		result = @elements[@index][0]
		@elements[@index][1] += 1
		@index +=1
		result
	end

	private

	def reorganize_elements
		@index = 0
		@elements = @elements.select { |e| e[1] < @max_get }
	end

end