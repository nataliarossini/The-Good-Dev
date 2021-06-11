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

  private

  def application_params
    params.require(:application).permit(:motivation_letter, :resume)
  end
end
