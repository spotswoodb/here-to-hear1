class EventsController < ApplicationController
  def index
    @events = Events.all
  end

  def new
      @event = Event.new
      @user = User.find_by(id: params[:user_id])
  end

  def create
    @user = User.find_by(id: params[:user_id])
      @event = @user.events.build(event_params)
      if @event.valid?
          @event.save
          redirect_to user_event_path(@event)
      else
          render :new
      end
  end

  def show    
      @event = Event.find_by_id(params[:id])
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
        params.require(:event).permit(:title, :date, :userd_id, :venue_id)
    end
end
