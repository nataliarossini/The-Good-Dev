class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(pararams[:id])
  end

  def dashboard
    @user = current_user
    @applications = @user.applications
    @projects = @user.projects
  end
end
