class Event < ApplicationRecord
    belongs_to :user
    belongs_to :venue
    validates :title, presence: true, on: :create
    validates :title, presence: true, on: :update
    validates :date, presence: true, on: :create
    validates :date, presence: true, on: :update
    accepts_nested_attributes_for :venue

    def venue_attributes=(venue_attributes)
       binding.pry
    end
    
end
# if !attribute_hash.empty?
#     self.venue = Venue.find_or_create_by(attribute_hash)
# end