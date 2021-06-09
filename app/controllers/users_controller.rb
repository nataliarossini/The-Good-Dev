class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def dashboard
    @user = current_user
    @applications = @user.applications
    @projects = @user.projects
    @my_skill = MySkill.new
    if @user.organization?
      @organization = current_user.organization
      @projects = @organization.projects
    end
  end
end
