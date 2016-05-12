class Genre
	attr_accessor :name
	@@all = []
	def initialize(name)
		@name = name
	end

	def Genre.create(name)
		genre = Genre.new(name)
		genre.save
		return genre
	end

	def save
		@@all << self
	end

	def Genre.all
		@@all
	end

	def Genre.destroy_all
		@@all = []
	end
end