class KnicksHistory::Season

  attr_accessor :year, :wins, :losses, :win_percentage, :off_rating, :def_rating, :best_player_ws, :pace, :playoff_results

  @@all = {}

  def initialize(season_hash = nil)
    if season_hash != nil
      @year = season_hash[:year]
      @wins = season_hash[:wins]
      @losses = season_hash[:losses]
      @win_percentage = season_hash[:win_percentage]
      @off_rating = season_hash[:off_rating]
      @def_rating = season_hash[:def_rating]
      @best_player_ws = season_hash[:best_player_ws]
      @pace = season_hash[:pace]
      @playoff_results = season_hash[:playoff_results]
      @@all[@year] = self
    end
  end

  def self.all
    @@all
  end

  def self.find_season(year)
    @@all.detect do |season|
      season[0] == year.to_s
    end
  end

  def year
    @year
  end

end
