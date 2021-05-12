class Venue < ApplicationRecord
    has_many :events
    has_many :users, through: :events
    validates :name, presence: true, uniqueness: true
    validates :seating, presence: true, length: { maximum: 20 } 

    def self.alphabetize
        order('name ASC')
    end
end
