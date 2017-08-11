# class UsersController < ApplicationController
#   def new
#     # @first_name = params[:name]
#     redirect_to @user(:id)
#   end
#
#   def create
#     @user = User.new(params.require(:user).permit(:first_name, :last_name, :email))
#     if @user.save
#       flash[:notice] = ['User successfully created']
#       redirect_to new_user_path # sends to new function
#     else
#       #errors we need to code later
#     end
#   end
# end

class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end
end
