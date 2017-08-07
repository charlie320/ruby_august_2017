class DojosController < ApplicationController
  def index
    render 'dojos/index'
  end

  def new

  end

  def create
    #Dojo.create( branch: params[:branches][:branch], street: params[:branches][:street], city: params[:branches][:city], state: params[:branches][:state])
    Dojo.create(dojo_params)
    redirect_to "/"
  end

  private
  def dojo_params
    params.require(:branches).permit(:branch, :street, :city, :state)
  end
end
