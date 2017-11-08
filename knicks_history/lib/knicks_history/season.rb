class KnicksHistory::Season

  attr_accessor :year, :wins, :losses, :win_percentage, :off_rating, :def_rating, :playoff_results, :coach, :best_player

  @@all = []

  def initialize(season_hash)
    @year = season_hash[:year]
    @wins = season_hash[:wins]
    @losses = season_hash[:losses]
    @win_percentage = season_hash[:win_percentage]
    @off_rating = season_hash[:off_rating]
    @def_rating = season_hash[:def_rating]
    @playoff_results = season_hash[:playoff_results]
    @coach = season_hash[:coach]
    @best_player = season_hash[:best_player]
    @@all << self
  end


end
