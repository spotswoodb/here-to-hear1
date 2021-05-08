class Event < ApplicationRecord
    belongs_to :user
    belongs_to :venue
    validates :title, presence: true, on: :create
    validates :title, presence: true, on: :update
    validates :date, presence: true, on: :create
    validates :date, presence: true, on: :update
    
    def venue_attributes=(attribute_hash)
        if !attribute_hash.empty?
            self.venue = Venue.find_or_create_by(attribute_hash)
        end
    end
    
end
