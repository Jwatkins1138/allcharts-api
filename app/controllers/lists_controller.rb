class ListsController < ApplicationController
  def index
    user = get_user_from_token
    if user
      lists = List.where("user_id = ?", user.id)
      render json: {
        lists: lists
      }
    end
  end

  def new
    list = List.new
  end

  def create
    user = get_user_from_token
    list = user.lists.build(list_params)

    if list.save
      render json: list
    else
      render json: list.errors
    end
  end

  def update
    list = List.find(params[:id])
    params[:list][:symbols].each do |symbol|
      list.symbols.push(symbol)
    end
    if list.save
      render json: list
    else
      render json: list.errors
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

  def list_params
    params.permit(:name, :symbols)
  end
end
