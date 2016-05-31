class Genre
  include Concerns::Common
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    @songs.uniq(&:artist).map(&:artist)
  end
  
end
