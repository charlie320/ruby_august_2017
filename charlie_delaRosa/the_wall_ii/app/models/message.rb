class Message < ActiveRecord::Base
  belongs_to :user

  # Message
  # content field: must be required, must be longer than 10 characters
  # User Reference field: must be required

  validates :content, presence: true, length: { minimum: 10 }
  validates :user_id, presence: true
end
