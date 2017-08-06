class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  has_many :messages

  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 1000 }
end
