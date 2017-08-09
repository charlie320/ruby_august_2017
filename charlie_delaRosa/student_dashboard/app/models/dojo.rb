class Dojo < ActiveRecord::Base
  has_many :students

  validates :branch, :street, :city, :state, presence: true
  validates :branch, :city, length: { in: 2..25}
  validates :street, length: { in: 5..25}
  validates :state, length: { is: 2}

end
