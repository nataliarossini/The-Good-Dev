class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :my_skills
  has_many :skills, through: :my_skills
  has_many :reviews
  has_many :applications
  has_many :projects, through: :applications
  enum user_type: [:volunteer, :organization]
  has_one :organization
  has_one_attached :photo
  has_many :chatrooms
  has_many :recipient_chatrooms, class_name: "Chatroom", foreign_key: :recipient_id
  has_many :messages, through: :chatrooms
  has_many :rec_messages, through: :recipient_chatrooms, source: :messages

  def all_messages
    messages + rec_messages
  end

  def all_chatrooms
    chatrooms + recipient_chatrooms
  end
end
