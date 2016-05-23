require_relative 'song'
require_relative 'artist'
require_relative 'genre'
class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    files = []
    Dir.foreach(@path) do |entry|
      unless entry.eql?("..") || entry.eql?(".")
        files << entry
      end  
    end
    files
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
    
  end
end

