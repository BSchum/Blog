class CommentsController < ApplicationController
    before_action :find_post
    def new
      @comment = Comment.new
    end
    def create
      @comment = @posts.comments.create(comment_params)
      if @comment.save
        redirect_to @posts
      else
        flash.now[:danger] = "error"
      end
    end

private
    def comment_params
        params.require(:comment)
              .permit(
                  :mail,
                  :content
              )
    end

    def find_post
      @posts = Post.find(params[:post_id])
    end
end