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
    bearer = request.headers['HTTP_AUTHORIZATION']
    bearer.present? ? bearer.split.last : nil # "Bearer: TOKEN"
  end
end
