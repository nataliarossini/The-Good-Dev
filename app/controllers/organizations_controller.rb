class OrganizationsController < ApplicationController
  def new
    @user = current_user
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(org_params)
    @organization.user_id = current_user.id
    if @organization.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def org_params
    params.require(:organization).permit(:name, :url, :registration, :category)
  end
end
