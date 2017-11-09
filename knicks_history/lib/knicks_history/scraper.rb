class KnicksHistory::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.basketball-reference.com/teams/NYK/"))
  end

  def scrape_seasons_index
    self.get_page.css("#NYK tr")
  end

  def make_seasons
    data_hash = {}
    scrape_seasons_index.each do |season|
      data_hash[:year] = season.css("th a").text.match(/\d{4}/)
      data_hash[:wins] = season.css("td[data-stat = wins]").text
      data_hash[:losses] = season.css("td[data-stat = losses]").text
      data_hash[:win_percentage] = season.css("td[data-stat = win_loss_pct]").text
      data_hash[:off_rating] = season.css("td[data-stat = off_rtg]").text
      data_hash[:def_rating] = season.css("td[data-stat = def_rtg]").text
      data_hash[:best_player] = season.css("td[data-stat = top_ws]").text
      KnicksHistory::Season.new(data_hash)
    end
  end
end
