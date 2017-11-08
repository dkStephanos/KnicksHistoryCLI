class KnicksHistory::CLI

  def call
    WorldsBestRestaurants::Scraper.new
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

  def output_stats(year)
    #prints stats for that year
  end

end
