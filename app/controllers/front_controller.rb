class FrontController < ApplicationController
  before_action :authenticate_user_session!

  def index
  end

  private

  def authenticate_user_session!
    authenticate_user!
    unless request.ip == session[:ip] && request.user_agent == session[:user_agent]
      reset_session
      redirect_to new_user_session_path, :notice => 'Please login again'
    end
  end
end
