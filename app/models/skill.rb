class Skill < ApplicationRecord
  has_many :my_skills
  # belongs_to :user, through: :my_skills
  # include PgSearch::Model
  # pg_search_scope :global_search,
  #   against: [ :name ],
  #   associated_against: {
  #     user: [ :first_name, :last_name ]
  #   },
  #   using: {
  #     tsearch: { prefix: true }
  #   }

end
