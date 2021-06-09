class OrganizationsController < ApplicationController
  def new
    @user = current_user
    @organization = Organization.new
  end

  def create
    # @user = current_user
    @organization = Organization.new(org_params)
    @organization.user = current_user
    if @organization.save
      redirect_to dashboard_path
    else
      render :new
    end
  end
end
