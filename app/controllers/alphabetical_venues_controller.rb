class AlphabeticalVenuesController < ApplicationController
    def index
        @alphabetical_venues = Venue.alphabetize
    end
end
