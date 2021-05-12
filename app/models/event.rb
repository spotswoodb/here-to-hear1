class Event < ApplicationRecord
    belongs_to :user
    belongs_to :venue
    validates :title, presence: true
    validates :date, presence: true
    validates :description, presence: true
    
    # accepts_nested_attributes_for :venue

    def venue_attributes=(venue_attributes)
    end
    
end
# if !attribute_hash.empty?
#     self.venue = Venue.find_or_create_by(attribute_hash)
# end