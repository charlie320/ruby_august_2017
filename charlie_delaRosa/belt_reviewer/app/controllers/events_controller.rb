class EventsController < ApplicationController

  def index
    @user = current_user
    @my_state = @user.state

    @attenders = AttendingEvent.where(event_id: params[:id])

    @in_state_events = Event.where(state: @my_state)
    @other_state_events = Event.where.not(state: @my_state)
  end

  def create
    event = Event.new(event_params)
    event.user = current_user
    #p event.class
    if event.save
      redirect_to events_path
    else
      flash[:notice] = event.errors.full_messages
      puts event.errors.full_messages
      redirect_to events_path
    end
  end

  def show
    @event = Event.find(params[:id])
    @event_count = Event.count  #where
    @attenders = @event.users
    @comments = Comment.where(event_id: @event.id)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.update(current_user.id, event_params)
    event.user = current_user
    #p event.class
    if event.valid?
      redirect_to events_path
    else
      flash[:notice] = event.errors.full_messages
      redirect_to events_path
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to events_path
  end

  private
    def event_params
      params.require(:new_event).permit(:name, :date, :city, :state)
    end
end
