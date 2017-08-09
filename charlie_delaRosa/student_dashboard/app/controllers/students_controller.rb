class StudentsController < ApplicationController
  def index
  end

  def new
    @id = session[:dojo]
    @thisDojo = Dojo.find(params[:dojo_id])
    #render students/new.html.erb
  end

  def create
    # puts "Made it to the create method"
    # @id = params[:dojo_id]
    # Student.create(student_params)
    # redirect_to dojo_path(@id) # maybe change to :dojo_id from student_params

    @student = Student.new(student_params)

    if @student.save
      redirect_to "/dojos/#{@student.dojo_id}", notice: "You have successfully created a Student!"
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @thisBranch = Dojo.find(params[:dojo_id])
    @thisStudent = Student.find(params[:id])
    @full_name = @thisStudent[:first_name] + " " + @thisStudent[:last_name]
    @cohorts = Student.where(:dojo_id => @thisBranch[:id]).where.not(:id => params[:id])
  end

  def edit
    @thisBranch = Dojo.find(params[:dojo_id])
    @thisStudent = Student.find(params[:id])
    @full_name = @thisStudent[:first_name] + " " + @thisStudent[:last_name]
    @cohorts = Student.where(:dojo_id => @thisBranch[:id]).where.not(:id => params[:id])
    @dojo_id = params[:dojo_id]
    @id = params[:id]
  end

  def update
    # @id = params[:id]
    # @dojo_id = params[:dojo_id]
    # Student.update(@id, student_params)
    # redirect_to dojo_path(@dojo_id) # maybe change to :dojo_id from student_params

    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to dojo_path(@student.dojo_id), notice: "You have successfully updated a Student!"
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    Student.find(params[:id]).delete
    redirect_to dojo_path(params[:dojo_id])
  end

  private
  def student_params
    params.require(:students).permit(:first_name, :last_name, :email, :dojo_id)
  end

end
