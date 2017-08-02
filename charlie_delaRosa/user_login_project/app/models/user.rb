class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email_address, :age, presence: true
  validates :age, numericality: { only_integer: true }, inclusion: { in: 10...150}
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :email_address, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX}
end
