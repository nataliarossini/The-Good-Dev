class Organization < ApplicationRecord
  belongs_to :user
  has_many :projects
  has_many :reviews
  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 50 }
  validates :registration, presence: true, uniqueness: true
  validates :category, inclusion: { in: %w(a b c) }
  validates :url, uniqueness: true
  acts_as_favoritable
end
