class ApplicationController < ActionController::Base
  before_filter :require_online
  protect_from_forgery with: :exception
  $session = nil
  private
  def role_template

  end
  def require_online
    if cookies[:key].nil?
      if self.controller_name != "sessions" || self.controller_name != "users"
        redirect_to root_path
      else
      end
    else
      @session =  Session.find(cookies[:key])
      if @session.nil?
        redirect_to root_path
      else
      end
    end
  end
end
