require_relative './concerns/findable'
require_relative './concerns/common'
class Artist
  include Concerns::Common
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end

  def all
    @@all
  end

  def self.all
    @@all
  end

  def self.all=(value)
    @@all = value
  end

  def add_song(song)
    unless @songs.include?(song)
      @songs << song
      song.artist = self
    end
  end

  def genres
    genres = []
    @songs.each do |song|
      genres << song.genre unless genres.include?(song.genre)
    end
    genres
  end
end
