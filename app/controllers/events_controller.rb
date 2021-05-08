class EventsController < ApplicationController
  def index
    @venue = Venue.find_by_id(params[:venue_id])
    @events = Event.all
  end

  def new

    @venue = Venue.find_by(id: params[:venue_id])
    @event = @venue.events.build
      
  end

  def create
    @venue = Venue.find_by(id: params[:venue_id])
    @event = @venue.events.build(event_params)
    binding.pry
      if @event.valid?
          @event.save
          redirect_to venue_event_path(@event)
      else
          render :new
      end
  end

  def show    
      @event = Event.find_by_id(params[:venue_id])
      if @event.blank?
          redirect_to new_user_path
      end
  end

  def edit
      @event = Event.find_by_id(params[:user_id])
  end
  
  def update
      @event = Event.find_by_id(params[:user_id])
      if @event.update(event_params)
          redirect_to events_path
      else
          render :edit
      end
  end 
  
  def destroy
      @event = Event.find_by_id(params[:user_id])
      @event.destroy
      redirect_to events_path
  end 


private

    def event_params
        params.require(:event).permit(:title, :date, :description, :venue_id, :user_id)
    end
end
