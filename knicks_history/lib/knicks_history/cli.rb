class KnicksHistory::CLI

  def call
    WorldsBestRestaurants::Scraper.new
    puts "New York Knicks - Statistics by Season"
    start
  end

  def start
    puts "\nWhich season would you like to see stats for? (Enter a year between 1946-2017)"
    input = gets.strip.to_i
  end

end
