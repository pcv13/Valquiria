class Player < ApplicationRecord
  has_many :match_players
  has_many :matchs,through: :match_players
end
  
