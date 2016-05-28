class Genre
  include Concerns::Common
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  @@all = []
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
    @songs.uniq(&:artist).map(&:artist)
  end
end
