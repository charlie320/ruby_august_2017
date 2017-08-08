class StudentsController < ApplicationController
  def index
  end

  def new
    @id = session[:dojo]
    @thisDojo = Dojo.find(params[:dojo_id])
    #render students/new.html.erb
  end

  def create
    puts "Made it to the create method"
    @id = session[:dojo]
    Student.create(student_params)
    redirect_to dojo_path(@id) # maybe change to :dojo_id from student_params
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def student_params
    params.require(:students).permit(:first_name, :last_name, :email, :dojo_id)
  end

end
