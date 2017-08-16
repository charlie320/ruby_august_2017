class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    #p user.class 
    if user.save
      redirect_to sessions_path
    else
      flash[:notice] = ["Can't be blank"]
      redirect_to sessions_path
    end
  end

  def edit
  end

  def update
  end

  private
    def user_params
      params.require(:register).permit(:first_name, :last_name, :email, :city, :state, :password)
    end

end
