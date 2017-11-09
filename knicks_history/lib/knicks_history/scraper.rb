class KnicksHistory::Scraper

  def get_page
    doc = Nokogiri::HTML(open("https://www.basketball-reference.com/teams/NYK/"))
    binding.pry
  end

  def make_seasons

  end
end
