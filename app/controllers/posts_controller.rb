class PostsController < ApplicationController
respond_to :js, :json, :html
before_action :authenticate_user!, except: [:index,:show]
    def index
        @posts = Post.search(params)
    end

    def new
        @posts = Post.new
    end
    def show
        @posts = Post.find(params[:id])
    end
    def create
        @posts = Post.new(posts_params)
        if @posts.save
            redirect_to posts_path
        else
            render template '/posts/new'
        end
    end
private
    def posts_params
        params.require(:post)
              .permit(
                  :title,
                  :content,
                  :category_id
              ).merge(user_id: current_user.id)
    end
end