class MyLanguage < ApplicationRecord
  belongs_to :user
  belongs_to :language
  validates :user, uniqueness: { scope: :language }
end
