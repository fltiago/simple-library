class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def index
  	@users = User.all
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
  end
end
