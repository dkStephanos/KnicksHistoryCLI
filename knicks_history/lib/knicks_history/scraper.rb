class KnicksHistory::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.basketball-reference.com/teams/NYK/"))
  end
end
