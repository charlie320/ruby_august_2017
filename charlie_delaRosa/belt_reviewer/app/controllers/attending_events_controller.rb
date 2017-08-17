class AttendingEventsController < ApplicationController

  def create
    attend = AttendingEvent.new()
    attend.user = current_user
    attend.event = Event.find(params[:id])
    #p event.class
    if attend.save
      redirect_to events_path
    else
      flash[:notice] = comment.errors.full_messages
      puts comment.errors.full_messages
      redirect_to events_path
    end
  end

  def destroy
    attend = AttendingEvent.find(params[:id])
    attend.destroy
    redirect_to events_path
  end

end
