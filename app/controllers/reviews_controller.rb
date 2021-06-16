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
      if current_user.organization?
        MyBadge.create(user_id: current_user.id, badge_id: Badge.find_by(name: "Reviewer").id).save if current_user.organization.reviews.count == 10 # This line is for reviewer badge (see seed file)
      else
        MyBadge.create(user_id: current_user.id, badge_id: Badge.find_by(name: "Reviewer").id).save if current_user.reviews.count == 10 # This line is for reviewer badge (see seed file)
        @project = Project.find(params[:project_id])
        if Review.where("organization_id = ? AND author_id != ?", @project.organization.id, @project.organization.id).count >= 3 && Review.where("organization_id = ? AND author_id != ?", @project.organization.id, @project.organization.id).average(:rating) > 4.5
          MyBadge.create(user_id: @project.organization.user.id, badge_id: Badge.find_by(name: "Top Rated").id).save! # This line is for Top Host badge (see seed file)
        else
          if MyBadge.where("user_id = ? AND badge_id = ?", @project.organization.user.id, Badge.find_by(name: "Top Rated").id).first
            MyBadge.where("user_id = ? AND badge_id = ?", @project.organization.user.id, Badge.find_by(name: "Top Rated").id).first.destroy # This line is for Top Host badge (see seed file)
          end
        end
      end
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :author)
  end
end
