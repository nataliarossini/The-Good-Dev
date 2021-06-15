class FavoritesController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    current_user.favorite(@project)
    redirect_to request.referrer
  end

  def destroy
    @project = Project.find(params[:project_id])
    current_user.unfavorite(@project)
    redirect_to request.referrer
  end
end
