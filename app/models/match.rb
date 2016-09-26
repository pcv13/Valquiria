class Match < ApplicationRecord
  belongs_to :game
  has_many :match_players
  has_many :players,through: :match_players
  self.per_page = 10

end
