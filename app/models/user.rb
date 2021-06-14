class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :my_skills, dependent: :destroy
  has_many :skills, through: :my_skills
  has_many :my_badges, dependent: :destroy
  has_many :badges, through: :my_badges
  has_many :reviews, dependent: :destroy
  has_many :applications, dependent: :destroy
  has_many :projects, through: :applications
  enum user_type: [:volunteer, :organization]
  has_one :organization
  has_one_attached :photo, dependent: :destroy
end
