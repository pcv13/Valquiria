class Match < ApplicationRecord
  belongs_to :game
  has_many :match_players
  has_many :players,through: :match_players
  self.per_page = 10




 	  validates :name,  presence: true
   	validates :star_time,  presence: true
end
