class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @reviews = Review.all
  end

  def show
    @project = Project.find(params[:id])
    # @markers = [{ lat: @project.latitude, lng: @project.longitude }]
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.organization = current_user.organization
    if @project.save
      redirect_to @project
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to @project
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy if current_user.organization == @project.organization
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :details, :location, :start_date, :end_date, :remote, photos: [])
  end

end
