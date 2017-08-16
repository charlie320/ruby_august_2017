class Event < ActiveRecord::Base
  belongs_to :user, required: true

  validates :name, :date, :city, :state, presence: true
  validates :state, length: { is: 2 }
  validates :name, :city, length: { in: 2..100 }
  validates_date :date, :on => :create, :on_or_after => :today

  has_many :attending_events, dependent: :destroy # attending_event objects connecting user
  has_many :users, through: :attending_events # users attending this event
  has_many :comments, dependent: :destroy # comments
  # has_many :users_commenting, through: :comments, source: :user # users through comments table
end
