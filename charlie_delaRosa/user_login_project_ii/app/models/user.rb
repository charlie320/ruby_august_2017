class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email_address, :age, presence: true
  validates :age, numericality: { only_integer: true }, inclusion: { in: 10...150 }
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :email_address, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  # this callback will run before saving on create and update
  before_save :downcase_email

  # this callback will run after creating a new user
  after_create :successfully_created

  # this callback will run after updating an existing user
  after_update :successfully_updated

  # this callback will only run on creating a record to ensure a default age of 0
  before_validation :default_age, on: [:create]

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  private
    def downcase_email
      self.email_address.downcase!
    end

    def successfully_created
      puts "Successfully created a new user"
    end

    def successfully_updated
      puts "Successfully updated a existing user"
    end

    def default_age
      self.age = 0 unless self.age?
    end

    # creating a custom class method. self refers to the User model
    def self.average_age
        self.sum(:age) / self.count
    end
  end
