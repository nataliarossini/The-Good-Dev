class MySkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  validates :skill_id, uniqueness: true
end
