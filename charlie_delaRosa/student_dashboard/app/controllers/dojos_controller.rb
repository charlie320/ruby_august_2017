class DojosController < ApplicationController
  # include Rails.application.routes.url_helpers
  def index
    render 'dojos/index'
  end

  def new
    render 'dojos/new'
  end

  def create
    # Dojo.create(dojo_params)
    # redirect_to "/"

    @dojo = Dojo.new(dojo_params)

    if @dojo.save
      redirect_to @dojo, notice: "You have successfully created a Dojo!"
    else
      flash[:errors] = @dojo.errors.full_messages
      redirect_to :back
end
  end

  def show
    @branch = Dojo.find(params[:id])
    @location = @branch[:branch]
    @street = @branch[:street]
    @city = @branch[:city]
    @state = @branch[:state]
    render "show"
  end

  def edit
    @branch = Dojo.find(params[:id])
    @location = @branch[:branch]
    session[:dojo] = @branch[:id]
    render 'edit'
  end

  def update
    # @id = session[:dojo]
    # Dojo.update(@id,dojo_params)
    # redirect_to dojo_path(@id)

    @dojo = Dojo.find(params[:id])

    if @dojo.update(dojo_params)
      redirect_to @dojo, notice: "You have successfully updated a Dojo!"
    else
      flash[:errors] = @dojo.errors.full_messages
      redirect_to :back
end
  end

  def destroy
    Dojo.find(params[:id]).delete
    render 'index'
  end

  private
  def dojo_params
    params.require(:branches).permit(:branch, :street, :city, :state)
  end

end
