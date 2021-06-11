class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if @user.organization?
      @organization = @user.organization
      @projects = @organization.projects
    end
  end

  # def edit
  #   @user = User.find(params[:id])

  # end

  # def update
  #   @user = User.find(params[:id])
  #   @user.update(user_params)
  #   redirect_to @user
  # end

  def dashboard
    @user = current_user
    @all_projects = Project.all
    @my_skill = MySkill.new
    if @user.organization?
      @organization = @user.organization
      @applications = []
      @projects = @organization.projects
      @projects.each { |project| @applications << project.applications }
    else
      @projects = @user.projects
      @applications = @user.applications
    end
  end

  private

  # def user_params
  #   params.require(:user).permit(:photo)
  # end
end
