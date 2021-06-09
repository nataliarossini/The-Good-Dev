class Project < ApplicationRecord
  belongs_to :organization
  has_many :applications
  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 100 }
  validates :details, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  has_many_attached :photos
end
