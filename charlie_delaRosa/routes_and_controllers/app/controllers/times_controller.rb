class TimesController < ApplicationController
  def index
    if !session[:count]
      session[:count] = 1
    else
      session[:count] += 1
    end
    render text: 'You have visited this page ' + session[:count].to_s + ' times.'
  end

  def restart
    # session[:id] = nil
    # session[:count] = 0
    session.clear
    render text: 'Destroyed the session'
  end
end
