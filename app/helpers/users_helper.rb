module UsersHelper
  def no_posts?(user)
    if user.posts.count == 0
      return true
    end
  end
  
  def no_comments?(user)
    if user.comments.count == 0
      return true
    end
  end
  
   
end
