require_relative './musicimporter'
require 'colorize'

class MusicLibraryController
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    puts prompt_message.colorize(:cyan)
    user_input = ''
    until user_input.eql?('exit')
      puts command_help
      user_input = gets.chomp
      if user_input.eql?('exit')
        break
      elsif user_options.include?(user_input)
        send user_options[user_input]
      else
        puts err_message
      end
    end
  end

  def prompt_message
    "

                              Ruby MusicLibrary
      =============================================================
    "
  end

  def user_options
    {
      'list songs' => :list_songs,
      'list artists' => :list_artists,
      'list genres' => :list_genres,
      'play song' => :play_song,
      'list artist' => :list_artist,
      'list genre' => :list_genre
    }
  end

  def err_message
    "
      Invalid Input Entered, Please Try Again
    ".colorize(:red)
  end

  def command_help
    "
      =============================================================
                          List of Possible Commands
      =============================================================
      list songs - Displays Detailed Information on Imported Songs
      list artists - Displays All Artists From Imported Songs
      list genres - Displays all Genres from Imported Songs
      play song - Play A Specific Song With Song Number
      list artist - Displays Songs with Artist name
      list genre - Displays Songs with Genre name
    ".colorize(:green) + "
      Please Enter Command Input....
    ".colorize(:cyan)
  end

  def list_songs
    Song.all.each_with_index do |song, indx|
      puts "#{indx + 1}. #{song}".colorize(:yellow)
    end
  end

  def list_artists
    Artist.all.each do |artist|
      puts artist.name.to_s.colorize(:yellow)
    end
  end

  def list_genres
    Genre.all.each do |genre|
      puts genre.name.to_s.colorize(:yellow)
    end
  end

  def play_song
    puts 'Please Enter Index of Song to Play'.colorize(:cyan)
    user_input = gets.chomp.to_i
    song_info = Song.all[user_input - 1]
    if song_info
      puts "Playing #{song_info}".colorize(:yellow)
    else
      puts err_message
    end
  end

  def list_artist
    puts 'Please Enter Artist Name'.colorize(:cyan)
    user_input = gets.chomp.to_s
    artist = Artist.find_by_name(user_input)
    display_songs(artist)
  end

  def list_genre
    puts 'Please Enter Genre Name'.colorize(:cyan)
    user_input = gets.chomp.to_s
    genre = Genre.find_by_name(user_input)
    display_songs(genre)
  end

  def display_songs(obj)
    if obj
      obj.songs.each do |song|
        puts song.to_s.colorize(:yellow)
      end
    else
      puts 'Name not Available'.colorize(:red)
    end
  end
end
