require_relative './concerns/findable'
require_relative './concerns/common'
class Artist
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
  		song.artist = self
  	end
  end

  def add_genre(genre)
  	@@genres << genre unless @@genres.include?(genre)
  end

  def genres
    genres = []
    @songs.each do |song|
      genres << song.genre unless genres.include?(song.genre)
    end
    genres
  end
end
