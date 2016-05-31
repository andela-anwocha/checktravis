class Message
  def self.welcome_message
    "

                              Ruby MusicLibrary
      =============================================================
    ".colorize(:cyan)
  end

  def self.command_help
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

  def self.err_message
    "
      Invalid Input Entered, Please Try Again
    ".colorize(:red)
  end
end