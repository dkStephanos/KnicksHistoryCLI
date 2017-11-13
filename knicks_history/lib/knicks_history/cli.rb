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
      input = gets.strip
      year = input.to_i
      if year < 2018 && year > 1945
        output_stats(input)
        while true
          puts "\nAdvanced Stats (enter the number of the statistic you want to see or type back)\n1. Offensive Rating\n2. Defensive Rating\n3. Best Player w/ Win Shares\n4. Offensive Pace\n5. Playoff Results"
          secondary_input = gets.strip
          case secondary_input
          when "1"
            output_off_rtng(input)
          when "2"
            output_def_rtng(input)
          when "3"
            output_best_player(input)
          when "4"
            output_pace(input)
          when "5"
            output_playoff_results(input)
          when "back"
            break
          else
            puts "\nSorry, must enter a number 1-3"
          end
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
    puts "\n\nYear  Wins  Losses  Win%"
    #binding.pry
    puts "#{season[1].year}   #{season[1].wins}     #{season[1].losses}    #{season[1].win_percentage}"
  end

  def output_off_rtng(year)
    season = KnicksHistory::Season.find_season(year)
    puts "\n\nOff Rtng\n#{season[1].off_rating}"
  end

  def output_def_rtng(year)
    season = KnicksHistory::Season.find_season(year)
    puts "\n\nDef Rtng\n#{season[1].def_rating}"
  end

  def output_best_player(year)
    season = KnicksHistory::Season.find_season(year)
    puts "\n\nBest Player(WS)\n#{season[1].best_player_ws}"
  end

  def output_pace(year)
    season = KnicksHistory::Season.find_season(year)
    puts "\n\nPace\n#{season[1].pace}"
  end

  def output_playoff_results(year)
    season = KnicksHistory::Season.find_season(year)
    puts "\n\nPlayoff Results\n#{season[1].playoff_results}"
  end

end
