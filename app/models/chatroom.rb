class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :user
  belongs_to :recipient, class_name: "User"
end
