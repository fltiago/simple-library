class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def current_user
    user_id = session[:user_id]
    User.find_by_id(user_id) if user_id
  end

  def client(space_id)
    ReduClient.new(current_user.access_token, space_id)
  end
end
