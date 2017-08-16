class User < ActiveRecord::Base
  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :city, :state,  presence: true
  validates :first_name, :last_name, length: { in: 2..100 }
  validates :state, length: { is: 2 }
  #validates :email, uniqueness: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX}
  validates :password, length: { in: 8..25 }

  has_many :events # events user has created
  has_many :attending_events, dependent: :destroy # attending_event objects
  has_many :events_joined, through: :attending_events, source: :event # events user is attending through attending_events table
  has_many :comments, dependent: :destroy # comments user has created
end
