class Organization < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :name, presence: true, uniquness: true, length: { minimum: 2, maximum: 50 }
  validates :registration_num, presence: true, uniquness: true
  validates :type, inclusion: { in: %w(a b c) }
  validates :url, uniquness: true
end
