class Song
	attr_accessor :name
	@@all = []
	def initialize(name)
		@name = name
		@artist = artist
	end

	def Song.create(name)
		song = Song.new(name)
		song.save
		return song
	end

	def Song.all
		@@all
	end

	def Song.destroy_all
		@@all = []
	end

	def save
		@@all << self
	end
end