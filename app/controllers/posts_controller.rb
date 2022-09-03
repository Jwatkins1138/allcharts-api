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

  def new
    post = Post.new
  end

  def create
    user = get_user_from_token
    post = user.posts.build(post_params)

    if post.save
      render json: post
    else
      render json: post.errors
    end
  end

  private

  def get_user_from_token
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
                  # Rails.application.credentials.devise[:jwt_secret_key]).first
                  ENV["SECRET_KEY_BASE"]).first
    user_id = jwt_payload['sub']
    user = User.find(user_id.to_s)
  end

  def post_params
    params.permit(:post, :symbol)
  end
end
