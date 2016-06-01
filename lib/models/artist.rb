class Artist  
  include Concerns::Common
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    @songs.uniq(&:genre).map(&:genre)
  end
end