class Event < ApplicationRecord
    belongs_to :user
    belongs_to :venue
    validates :title, presence: true
    validates :date, presence: true
    validates :description, presence: true  
end
