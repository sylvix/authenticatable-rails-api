class ApplicationController < ActionController::API
  protected

  def ensure_authenticated_user
    head :unauthorized unless current_user
  end

  def current_user
    api_key = ApiKey.active.where(access_token: token).first
    api_key ? api_key.user : nil
  end

  def token
    # header of following format is expected: "Bearer: TOKEN"
    bearer = request.headers['HTTP_AUTHORIZATION']
    bearer.split.last if bearer.present?
  end
end
