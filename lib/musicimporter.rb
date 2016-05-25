class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    files = []
    Dir.foreach(@path) do |entry|
      files << entry unless entry.eql?('..') || entry.eql?('.')
    end
    files
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
