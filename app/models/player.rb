class Player < ActiveRecord::Base
  has_many :games, :dependent => :destroy

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }

  def won_games
    games.select { |game| game.won? }
  end

  def lost_games
    games.select { |game| game.lost? }
  end

  def in_progress_games
    games.select { |game| !game.game_over? }
  end

  def win_loss_rate
    if lost_games.count == 0
      won_games.count.to_f
    else
      won_games.count / lost_games.count.to_f
    end
  end

  def ranking
    players = Player.all.sort_by { |player| player.rank_weight }.reverse
    players.index(self) + 1
  end

  def rank_weight
    win_loss_rate * games.count + won_games.count
  end
end
