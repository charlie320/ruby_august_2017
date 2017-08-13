class SessionsController < ApplicationController
  def new
    #render login page
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = ["Invalid Combination"]
      redirect_to "/sessions/new"
    end
    # Log User In
    # if authenticate true
        # save user id to session
        # redirect to users profile page
    # if authenticate false
        # add an error message -> flash[:errors] = ["Invalid"]
        # redirect to login page
  end

  def destroy
    reset_session
    redirect_to "/sessions/new"
    # Log User out
    # set session[:user_id] to null
    # redirect to login page
  end
end
