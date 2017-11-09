class KnicksHistory::CLI

  def call
    scraper = KnicksHistory::Scraper.new
    scraper.make_seasons
    puts "New York Knicks - Statistics by Season"
    start
  end

  def start
    input = ""
    while true
      puts "\nWhich season would you like to see stats for? (Enter a year between 1946-2017) or type all to list all seasons or type exit."
      input = gets.strip
      year = input.to_i
      if year < 2018 && year > 1945
        output_stats(input)
        puts "\nOther Stats (enter the number of the statistic you want to see)\n1. Offensive Rating\n2. Defensive Rating\n3. Best Player w/ Win Shares"
        input = gets.strip
        case input
        when "1"
        when "2"
        when "3"
        else
          puts "\nSorry, must enter a number 1-3"
        end
      elsif input == "exit"
        puts "\n\nThanks for using my gem! Go Knicks!"
        break
      else
        puts "\nSorry, no season found for that selection. Try again."
      end
    end
  end

  def output_stats(year)
    #prints stats for that year
    season = KnicksHistory::Season.find_season(year)
    puts "\n\nYear  Wins  Losses  Win%" #  Off Rtng  Def Rtng  Best Player(WS)"
    #binding.pry
    puts "#{season[1].year}   #{season[1].wins}     #{season[1].losses}    #{season[1].win_percentage}" #{}"   #{season[1].off_rating}     #{season[1].def_rating}    #{season[1].best_player_ws}"
  end

end
