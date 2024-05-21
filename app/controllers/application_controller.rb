class ApplicationController < ActionController::Base
  helper_method :admin?

  private

  def admin?
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["ADMIN_USERNAME"] && password == ENV["ADMIN_PASSWORD"]
    end
    rescue ActionController::RoutingError, ActionController::InvalidAuthenticityToken
      false
  end
end
