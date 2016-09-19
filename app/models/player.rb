class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD

   	before_save { self.email = email.downcase }

   	validates :name,  presence: true, length: { maximum: 50 }
     VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
     validates :email, presence: true, length: { maximum: 255 },
                       format: { with: VALID_EMAIL_REGEX },
                       uniqueness: { case_sensitive: false }


   	def tasks_count
   		self.tasks.count
   	end

=======
>>>>>>> bf6136f1f4a987b88bf68a673029293171318f94
  has_many :match_players
  has_many :matches,through: :match_players
end
