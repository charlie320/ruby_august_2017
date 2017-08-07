class UsersController < ApplicationController

  def index
    session[:views] ||= 0
    render "index"
  end

  def result
    session[:views] = session[:views] + 1
    session[:result] = params[:survey]
    @survey = session[:result]
    flash[:success] = "Thanks for submitting this form!  You have submitted
    this form #{session[:views]} time(s) now."
    render "result"
  end

end
