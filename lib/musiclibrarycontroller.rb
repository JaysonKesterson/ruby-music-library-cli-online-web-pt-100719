class MusicLibraryController
  
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end
  
  def call
    input = nil
    while input != "exit" do
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets
    end
  end
  
  def list_songs
    Song.all.sort_by(&:name).each_with_index do |song,index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    Artist.all.sort_by(&:name).each_with_index do |artist,index|
      puts "#{index + 1}. #{artist.name}"
    end
  end
  
  def list_genres
    Genre.all.sort_by(&:name).each_with_index do |genre,index|
      puts "#{index + 1}. #{genre.name}"
    end
  end
    
  def list_songs_by_artist
      puts "Please enter the name of an artist:"
      input = gets.strip
      if artist = Artist.find_by_name(input)
      artist.songs.sort_by(&:name).each_with_index do |song,index|
      puts "#{index + 1}. #{song.artist.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
     puts "Please enter the name of a genre:"
      input = gets.strip
      if genre = Genre.find_by_name(input)
      genre.songs.sort_by(&:name).each_with_index do |song,index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets
    if list_songs.include?(input)
      song = list_songs[input]
      puts "Playing #{song.name} by #{song.artist}"
    end
  end
end