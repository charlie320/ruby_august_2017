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
    @secrets = Secret.where("user_id = #{@user.id}")
  end

  def edit
    # @id = session[:user_id]
    # @user = User.find(@id)
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_show_path(@user.id)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      reset_session
      redirect_to users_new_path
    else
      redirect_to users_edit_path
    end
  end

  private
  def user_params
    params.require(:users).permit(:name, :email, :password, :password_confirmation)
  end
end
