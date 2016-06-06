class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :most_recent_tool, :current_user


  def most_recent_tool
    @most_recent_tool ||= Tool.where(user_id: session[:most_recent_tool_id]).last if session[:most_recent_tool_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
