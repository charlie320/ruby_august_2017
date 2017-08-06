class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create_user
    User.create(name:params[:name])
    redirect_to '/users'
    # render text: "I will eventually create a new user"
  end

  def show_user_info
    render json: User.find(params[:id])
  end

  def new

  end

  def edit
    @user = User.find(params[:id])
  end

  def edit_user
    render text: "I will someday do something with this data."
    # render json: User.find(params[:name])
  end

  def total
    render json: User.count
  end

end
