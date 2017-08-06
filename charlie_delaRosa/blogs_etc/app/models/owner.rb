class Owner < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog

  def add_owner(blogId, userId)
    user1 = Owner.new
    user1.blog_id = blogId
    user1.user_id = userId
    user1.save
  end

end
