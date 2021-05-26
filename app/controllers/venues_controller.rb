class VenuesController < ApplicationController

    def index
        @venues = Venue.all
        @event = Event.all
    end

    def new
        @venue = Venue.new
        @venue.events.build
    end

    def create
        # @venue = Venue.new(venue_params)
        # @event = Event.find_by(id: params[:id])
        # # @venue = @event.venues.build(venue_params)
        # # binding.pry
        # if @venue.save
        #     binding.pry
        #     redirect_to venue_path(@venue)
        # else
        #     render :new
        # end
        if @event
            @venue = @event.venues.build(venue_params)
        else 
            @venue = Venue.new(venue_params)
        end

        if @venue.save
            redirect_to venue_path(@venue)
        else
            render :new
        end
    end

    def show
        @event = Event.find_by_id(params[:id])
        @venue = Venue.find_by_id(params[:venue_id])
        if @venue.blank?
            redirect_to venues_path
        end
    end

private

    def venue_params
        params.require(:venue).permit(:name, :seating)
    end
    
end