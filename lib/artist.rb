require 'pry'
class Artist
  
  attr_accessor :name
  attr_reader :songs
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end
  
  def genres
    genres = songs.collect{|song| song.genre if (song.artist == self)}.uniq
  end 
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    all.clear
  end
  
  def save
    self.class.all << self
  end
  
  def self.create(name)
    artist_new = Artist.new(name)
    artist_new.save
    artist_new
  end
  
  def add_song(song_obj)
    if song_obj.artist == nil
    song_obj.artist = self
    end
    unless self.songs.include?(song_obj) 
    self.songs << song_obj
    end
  end
  
end