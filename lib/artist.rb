class Artist
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def add_song(song)
    @songs << song
    song.artist = self
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.find_or_create_by_name(name)
    found_artist = @@all.find { |artist| artist.name == name }

    if found_artist == nil
      self.new(name)
    else 
      found_artist
    end
  end
  
  def print_songs
    @songs.each { |song| puts "#{song.name}" }
  end
  
  
end