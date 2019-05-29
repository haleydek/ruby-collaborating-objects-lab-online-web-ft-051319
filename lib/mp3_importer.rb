require "pathname"

class MP3Importer
  attr_reader :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    Pathname(@path).children.collect do |filename|
      filename.basename.to_s
    end
  end
  
  def import
    files.each do |filename|
      Song.new_by_filename(filename)
    end
  end
  
end