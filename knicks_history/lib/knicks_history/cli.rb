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
      puts "\nWhich season would you like to see stats for? (Enter a year between 1946-2017) or type exit."
      input = gets.strip.to_i
      if input < 2018 && input > 1945
        output_stats(input)
      elsif input == exit
        puts "Thanks for using my gem! Go Knicks!"
        break
      end
    end
  end

  def output_stats(year)
    #prints stats for that year
    season = KnicksHistory::Season.find_season(year)
    puts "\n\nYear  Wins  Losses  Win%  Off Rtng  Def Rtng  Best Player(WS)"
    #binding.pry
    puts "#{season[1].year}   #{season[1].wins}     #{season[1].losses}    #{season[1].win_percentage}   #{season[1].off_rating}     #{season[1].def_rating}    #{season[1].best_player_ws}"
  end

end
