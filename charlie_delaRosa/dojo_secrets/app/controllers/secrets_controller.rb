class SecretsController < ApplicationController
  def index
    @secrets = Secret.all
  end

  def create
    @secret = Secret.new(user: current_user, content: params[:content])
    @secret.save
    redirect_to users_show_path(current_user)
  end

  def destroy
    # @secret = Secret.find(params[:secret_id])
    @secret = Secret.find(params[:id])
    @secret.destroy
    redirect_to users_show_path(current_user)
  end
end
