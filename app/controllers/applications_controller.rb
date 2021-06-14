class ApplicationsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @application = Application.new
  end

  def create
    @project = Project.find(params[:project_id])
    @application = Application.new(application_params)
    @application.project = @project
    @application.user = current_user
    if @application.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def assess
    @application = Application.find(params[:application_id])
    @user = @application.user # @user here is the user who made the application for the project
    @project = @application.project
  end

  def respond
    @application = Application.find(params[:application_id])
    @application.update(application_params)
    redirect_to dashboard_path
  end

  private

  def application_params
    params.require(:application).permit(:motivation_letter, :resume, :status)
  end
end
