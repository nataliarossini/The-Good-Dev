class Application < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :motivation_letter, presence: true
  validates :status, presence: true
  enum status: [:open, :accepted, :declined]
  has_one_attached :resume
  validates :user, uniqueness: { scope: :project }
end

# ajoute defaut :open a la table application pour le status
