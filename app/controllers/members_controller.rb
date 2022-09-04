class MembersController < ApplicationController
  before_action :authenticate_user!
  

  def show
    user = get_user_from_token
    render json: {
      message: "youre in",
      user: user.as_json(include: :lists)
    }
  end

  private

  def get_user_from_token
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
                  # Rails.application.credentials.devise[:jwt_secret_key]).first
                  ENV["SECRET_KEY_BASE"]).first
    user_id = jwt_payload['sub']
    user = User.find(user_id.to_s).includes(:lists)
  end
end