class ReviewsController < ApplicationController
  def new
    @review = Review.new
    if current_user.organization?
      @reviewed = User.find(params[:user_id]) # Make sure to assign @user as parameter to the link path
    else
      @project = Project.find(params[:project_id])
      @reviewed = @project
    end
  end

  def create
    @review = Review.new(review_params)
    @review.author_id = current_user.id
    # Scenario of organization reviewing a volunteer
    if current_user.organization?
      @user = User.find(params[:user_id])
      @review.user = @user
      @review.organization = current_user.organization
    # Scenario of volunteer reviewing an organization
    else
      @project = Project.find(params[:project_id])
      @review.organization = @project.organization
      @review.user = current_user
    end
    if @review.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :author)
  end
end
