require_relative './concerns/common'
require_relative './concerns/findable'

class Song
  include Concerns::Common
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      self.artist = artist
    end
    if genre
      self.genre = genre
    end
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

  def self.new_from_filename(file_name)
    model_names = file_name.gsub('.mp3', '').split(' - ')
    Song.new(model_names[1], Artist.find_or_create_by_name(model_names[0]), Genre.find_or_create_by_name(model_names[2]))
  end

  def self.create_from_filename(file_name)
    song = new_from_filename(file_name)
    song.save
    song
  end

  def artist=(artist)
    if artist.songs.include?(self)
      @artist = artist
    else
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    if genre.songs.include?(self)
      @genre = genre
    else
      @genre = genre
      genre.add_song(self)
    end
  end

  def to_s
    "#{artist.name} - #{name} - #{genre.name}"
  end
end
