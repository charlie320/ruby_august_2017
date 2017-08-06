class Blog < ActiveRecord::Base
  has_many :posts
  has_many :owners
  has_many :users, through: :owners

  validates :name, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 500 }

  after_create :create_owner

  before_destroy :destroy_owner

private
  def create_owner
    user1 = Owner.new
    user1.blog_id = self.id
    user1.save
  end

  def destroy_owner
    Owner.where(blog_id = self.id).destroy
  end

end
