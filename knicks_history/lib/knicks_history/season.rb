class KnicksHistory::Season

  attr_accessor :year, :wins, :losses, :win_percentage, :off_rating, :def_rating, :best_player_ws

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
      @@all[@year] = self
    end
  end

  def self.all
    @@all
  end

  def find_season(year)
    @@all.find do |season|
      season[:year] == year.to_sym
    end
  end

end
