class Project
  @@no_of_projects = 0

  attr_accessor :project_name, :project_description, :project_owner
  attr_reader :tasks

  def initialize(name, description, owner)
    @project_name = name
    @project_description = description
    @project_owner = owner
    @tasks = []
    @@no_of_projects += 1
    puts "Number of projects:  #{@@no_of_projects}"
  end

  def elevator_pitch
    "#{@project_name}, #{@project_description}"
  end

  def print_tasks
    @tasks.each { |elem| puts elem }
  end

  def add_tasks task
    @tasks << task
  end
end
