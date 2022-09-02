class PostsController < ApplicationController
  def index
    if params
      posts = Post.where("symbol = ?", params[:symbol]).includes(:user) 
      render json: {
        posts: posts.as_json(include: :user)
      }
    else 
      posts = Post.includes(:user) 
      render json: {
        posts: posts.as_json(include: :user)
      }
    end
  end
end
