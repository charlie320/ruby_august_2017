class Dojo < ActiveRecord::Base
  #has many :ninjas
  validates :name, :city, :state, presence: true
  validates :state, length: { is: 2 }

  before_destroy :delete_ninjas

  private
  def delete_ninjas
    Ninja.where(dojo_id: = :id).destroy
  end
end


#For the dojo, require the presence of the name, city, and state;
#also require the state to be two characters long
