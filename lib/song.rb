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

  def self.new_from_filename(file_name)
    model_names = file_name.gsub('.mp3', '').split(' - ')
    artist = Artist.find_or_create_by_name(model_names[0])
    genre = Genre.find_or_create_by_name(model_names[2])
    Song.new(model_names[1], artist, genre)
  end

  def self.create_from_filename(file_name)
    song = new_from_filename(file_name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    unless artist.songs.include?(self)
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    unless genre.songs.include?(self)
      @genre = genre
      genre.add_song(self)
    end
  end

  def to_s
    "#{artist.name} - #{name} - #{genre.name}"
  end
end
