class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   	before_save { self.email = email.downcase }
    has_many :chat_rooms, dependent: :destroy
    has_many :messages, dependent: :destroy
    has_many :match_players
    has_many :matches,through: :match_players

   	validates :name,  presence: true, length: { maximum: 50 }
     VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
     validates :email, presence: true, length: { maximum: 255 },
                       format: { with: VALID_EMAIL_REGEX },
                       uniqueness: { case_sensitive: false }


   	def tasks_count
   		self.tasks.count
   	end

  


end
