class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to sessions_new_path
    else
      flash[:notice] = ["Can't be blank"]
      redirect_to users_new_path
    end
  end
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  private
  def user_params
    params.require(:users).permit(:name, :email, :password, :password_confirmation)
  end
end
