class Post < ApplicationRecord
    belongs_to :category
    belongs_to :user
    has_many :comments
    
    def self.search(args)
      if args[:category_id] 
        out = Post.where(["category_id = ?", args[:category_id]])
      elsif args[:tag_id]
        out = Post.joins(:post_tags).where(["post_tags.tag_id = ?", args[:tag_id]])      
      elsif args[:slug]
        out = Post.where(["user_id = ?", args[:slug].to_i])
      elsif args[:string]
        out = Post.joins(:user).where(["description LIKE ? 
                                        OR users.firstname LIKE ?
                                        OR users.lastname  LIKE ?",
                                        "%#{args[:string]}%",
                                        "%#{args[:string]}%",
                                        "%#{args[:string]}%"])
      else
        out = Post.all
      end
      if args[:offset]
        out.limit(5).offset(args[:offset])
      else
        out.limit(5)
      end
    end


end
