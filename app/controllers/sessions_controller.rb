class SessionsController < ApplicationController
  def create
    email = user_data["info"]["email"]
    user = User.find_by_email(email)

    debugger
    unless user
      user = User.create do |user|
        user.name = user_data["info"]["name"]
        user.last_name = user_data["extra"]["raw_info"]["last_name"]
        user.email = user_data["info"]["email"]
        user.access_token = user_data["credentials"]["token"]
      end
    end

    session[:user_id] = user.id

    redirect_to user_path(user)
  end

  protected

  def user_data
    request.env['omniauth.auth']
  end
end
