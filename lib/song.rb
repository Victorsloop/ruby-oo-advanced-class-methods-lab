class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create 
    jam = Song.new 
    jam.save ## Method given to us in order to save songs 
    jam
  end 

  def self.new_by_name(title)
    jam = self.new 
    jam.name = title 
    jam
  end 

  def self.create_by_name(title)
    jam = self.create
    jam.name = title 
    jam
  end

  def self.find_by_name(target)
    self.all.detect{|title| title.name ==  target }
  end 

  def self.find_or_create_by_name(title)
    self.find_by_name(title) || self.create_by_name(title) 
  end 

  def self.alphabetical ## { |a, b| a <=> b }
    ##self.all.sort {|a,b| a <=> b}
    self.all.sort_by{|title| title.name }
  end 

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
