class TimesController < ApplicationController

  def main
    currentTime = Time.now.in_time_zone('US/Central')
    @strDate = currentTime.strftime("%b %d, %Y")
    @strTime = currentTime.strftime("%I:%M %p")
    render 'index'
  end

end
