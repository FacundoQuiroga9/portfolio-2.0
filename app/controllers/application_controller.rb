class ApplicationController < ActionController::Base
  helper_method :admin?

  private

  def admin?
    session[:admin]
  end

  def authenticate_admin
    Rails.logger.info "ENV['ADMIN_USERNAME']: #{ENV['ADMIN_USERNAME']}"
    Rails.logger.info "ENV['ADMIN_PASSWORD']: #{ENV['ADMIN_PASSWORD']}"

    authenticate_or_request_with_http_basic do |username, password|
      if username == ENV["ADMIN_USERNAME"] && password == ENV["ADMIN_PASSWORD"]
        session[:admin] = true
        Rails.logger.info "Admin authenticated successfully"
        true
      else
        session[:admin] = false
        Rails.logger.info "Admin authentication failed"
        false
      end
    end
  end


end
