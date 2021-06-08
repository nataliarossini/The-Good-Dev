class Skill < ApplicationRecord
    validates :name, presence: true, uniquness: true, length: { minimum: 1, maximum: 20 }
end
