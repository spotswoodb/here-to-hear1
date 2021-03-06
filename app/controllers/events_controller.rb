  class EventsController < ApplicationController
    before_action :find_event, :find_venue

    def index
      @events = @venue.events
    end

    def new
      @event = Event.new
    end

    def create
      @event = @venue.events.build(event_params)
        if @event.save
            redirect_to venue_events_path(@venue)
        else
            render :new
        end
    end

    def show 
        if @event.blank?
            redirect_to new_user_path
        end  
    end

    def edit
    end

    def update
      if @event.update(event_params)
        redirect_to event_path(@event)
      else
        render :edit
      end
    end

    def destroy
        @event.destroy
        redirect_to events_path
    end 

  private

      def event_params
          params.require(:event).permit(:title, :date, :description, :venue_id, :user_id)
      end

      def find_event
          @event = Event.find_by_id(params[:id])
      end

      def find_venue
          @venue = Venue.find_by(id: params[:venue_id])
      end
      
  end