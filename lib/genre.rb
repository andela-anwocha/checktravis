require_relative './concerns/findable'
require_relative './concerns/common'
class Genre
  include Concerns::Common
  extend Concerns::Findable
	attr_accessor :name, :songs
	
	def initialize(name)
		@name = name
		@songs = []
	end

	def add_song(song)
		unless @songs.include?(song)
		  @songs << song
			song.genre = self
		end
	end
  
  def artists
    artists = []
    @songs.each do |song|
      artists << song.artist unless artists.include?(song.artist)
    end
    artists
  end
end

