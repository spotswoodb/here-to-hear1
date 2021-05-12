class EventsController < ApplicationController
  def index
    @venue = Venue.find_by_id(params[:venue_id])
    @events = Event.all
  end

  def new
    @event = Event.new
    @venue = Venue.find_by(id: params[:venue_id])
  end

  def create
    @venue = Venue.find_by(id: params[:venue_id])
    @event = @venue.events.build(event_params)
    byebug
      if @event.valid?
          @event.save
          redirect_to venue_event_path(@venue, @event)
      else
          render :new
      end
  end

  def show 
      @event = Event.find_by_id(params[:id])
      @venue = @event.venue
      if @event.blank?
          redirect_to new_user_path
      end  
  end

  def edit
      @event = Event.find_by_id(params[:id])
      @venue = @event.venue
  end
  
  def update
      @event = Event.find_by_id(params[:id])
      @venue = @event.venue
      @event.update(event_params)
      if @event.valid?
          redirect_to venue_event_path(@venue, @event)
      else
          render :edit
      end
  end 
  
  def destroy
      @event = Event.find_by_id(params[:id])
      @venue = @event.venue
      @event.destroy
      redirect_to events_path
  end 


private

    def event_params
        params.require(:event).permit(:title, :date, :description, :venue_id, :user_id)
    end
end
