class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  def index
    if params[:query].present?
      @projects = Project.search_by_title_and_location(params[:query])
      @reviews = Review.all
    else
      @projects = Project.all
      @reviews = Review.all
    end
  end

  def show
    @project = Project.find(params[:id])
    @chatroom = Chatroom.where(user: current_user, recipient: @project.organization.user).or(Chatroom.where(user: @project.organization.user, recipient: current_user)).first
    @markers = [{ lat: @project.latitude, lng: @project.longitude }]
    
    # @contact = Chatroom.create(name: 'Contact')
    # raise
    # if @contact.save
    #   redirect_to chatroom_path
    # else
    #   render :show
    # end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.organization = current_user.organization
    if @project.save
      MyBadge.create(user_id: current_user.id, badge_id: Badge.find_by(name: "Experienced Host").id).save if current_user.organization.projects.count == 10 # This line is for job-doer badge (see seed file)
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

  def favorite
    @project = Project.find(params[:id])
    current_user.favorite(@project)
    redirect_to projects_path

  end

  def unfavorite
    @project = Project.find(params[:id])
    current_user.unfavorite(@project)
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :details, :location, :start_date, :end_date, :remote, photos: [])
  end

end
