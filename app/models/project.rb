class Project < ApplicationRecord
  belongs_to :organization
  has_many :applications
  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: { maximum: 100 }
  validates :details, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  has_many_attached :photos
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  acts_as_favoritable
  include PgSearch::Model
  pg_search_scope :search_by_title_and_location,
    against: [ :title, :location ],
    using: {
      tsearch: { prefix: true }
    }
end
