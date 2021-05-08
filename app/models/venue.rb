class Venue < ApplicationRecord
    has_many :events
    has_many :users, through: :events

    validates :name, presence: true, uniqueness: true
end
