class User < ActiveRecord::Base
  has_many :messages
  # Username field: must be required, must be unique, must be longer than 5 characters
  validates :username, presence: true, uniqueness: true, length: { minimum: 5}
end
