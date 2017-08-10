require_relative 'project2'
RSpec.describe Project2 do
  it "has a getter and setter for name attribute" do
    project2 = Project2.new
    project2.name = "Project2 Name"
    expect(project2.name).to eq("Project2 Name")
  end

  it "has a getter and setter for the description attribute" do
  project = Project2.new
  project.description = "Description"
  expect(project.description).to eq("Description")
  end

  it 'has a method elevator_pitch to explain name and description' do
    project = Project2.new
    project.name = "Name"
    project.description = "Description"
    expect(project.elevator_pitch).to eq("Name, Description")
  end
end
