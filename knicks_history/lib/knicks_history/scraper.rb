class KnicksHistory::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.basketball-reference.com/teams/NYK/"))
  end

  def scrape_seasons_index
    self.get_page.css("#NYK tbody tr")
  end

  def make_seasons
    data_hash = {}
    scrape_seasons_index.each do |season|
      data_hash[:year] = season.css("th a").text.match(/\d{4}/).to_s
      data_hash[:wins] = season.css("td[data-stat = wins]").text
      data_hash[:losses] = season.css("td[data-stat = losses]").text
      data_hash[:win_percentage] = season.css("td[data-stat = win_loss_pct]").text
      if data_hash[:off_rating] = season.css("td[data-stat = off_rtg]").text == ""
        data_hash[:off_rating] = "N/A"
        data_hash[:def_rating] = "N/A"
      else
        data_hash[:off_rating] = season.css("td[data-stat = off_rtg]").text
        data_hash[:def_rating] = season.css("td[data-stat = def_rtg]").text
      end
      data_hash[:best_player_ws] = season.css("td[data-stat = top_ws]").text
      KnicksHistory::Season.new(data_hash)
    end
  end
end
