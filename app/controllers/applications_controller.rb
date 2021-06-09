class ApplicationsController < ApplicationController
  def new
  end

  def create
    @project = Project.find(params[:project_id])
    @application = Application.new
  end

  def create
    @project = Project.find(params[:project_id])
    @application = Application.new(application_params)
    @application.project = @project
    if @order.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def application_params
    params.require(:application).permit(:motivation_letter, :resume)
# 7f65a767cf421a3ae2c588692191bf3411f3c1e2
  end
end
