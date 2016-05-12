class Artist
	attr_accessor :name, :songs
	@@all = []
	def initialize(name)
		@name = name
		@songs = []
	end
	def Artist.create(name)
		artist = Artist.new(name)
		artist.save
		return artist
	end
	def Artist.all
		@@all
	end
	def save
		@@all << self
	end
	def Artist.destroy_all
		@@all = []
	end
end