class ChatRoom < ApplicationRecord
  belongs_to :player
  has_many :messages, dependent: :destroy
end
