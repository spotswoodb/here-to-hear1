class VenuesController < ApplicationController
    
    def index
        @venues = Venues.all
    end

    def new
        @venue = Venue.new
    end

    def create
        @user = User.find_by(id: params[:user_id])
        @venue = @user.venues.build(veneu_params)
        if @venue.save
            redirect_to user_venue_path(@venue)
        else
            render :new
        end
    end

private

    def venue_params
        params.require(:venue).permit(:name, :address, :phone_number, :id)
    end
end
