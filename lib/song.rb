class Song
  attr_accessor :name, :artist
  # Expect value passed into artist to be an instance of artist class
  # Expect value passed into name to be a string
  
  
  def initialize(name)
    @name = name
  end
  
  def self.new_by_filename(filename)
    file_array = filename.split(" - ")
    new_song = Song.new(file_array[1])
    new_artist = Artist.find_or_create_by_name(file_array[0])
    new_song.artist = new_artist
    new_artist.add_song(new_song).save
    new_song
  end

end