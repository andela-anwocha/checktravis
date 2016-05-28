class Artist  
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
      song.artist = self
    end
  end

  def genres
    @songs.uniq(&:genre).map(&:genre)
  end
end