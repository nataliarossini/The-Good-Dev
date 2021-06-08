class Review < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  validates :content, presence: true, length: { minimum: 10, maximum: 120 }
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: 0..5 }
  validates :author, presence: true, length: { maximum: 20}
end
