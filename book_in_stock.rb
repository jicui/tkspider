class BookInStock
	attr_reader :isbn
	attr_accessor :price
	def initialize(isbn,price)
		@isbn=isbn
		@price=Float(price)
	end
	def to_s
		"ISBN=#{@isbn} and Price=#{@price}"
	end
	def price_in_cents
		Integer @price*100+0.5
	end
end