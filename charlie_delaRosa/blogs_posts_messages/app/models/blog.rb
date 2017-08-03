class Blog < ActiveRecord::Base
  validates :name, :description, presence: true
end
