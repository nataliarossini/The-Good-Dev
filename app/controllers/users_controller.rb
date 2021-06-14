class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @reviews = Review.all
    if @user.organization?
      @organization = @user.organization
      @projects = @organization.projects
    else
      @projects = @user.projects
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
    @skills = Skill.all
    if @user.organization?
      @organization = @user.organization
      @projects = @organization.projects
      arr = []
      @projects.each { |e| arr << e.id }
      @applications = Application.all.select { |application| arr.include?(application.project_id) } # Be careful, if there is app, it will return empty array, not nil!!!
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
