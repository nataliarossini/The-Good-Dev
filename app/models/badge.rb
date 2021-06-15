class Badge < ApplicationRecord
  has_many :my_badges
  validates :name, presence: true, uniqueness: true
  validates :about, presence: true
  validates :condition, presence: true, uniqueness: true
end
