class ReviewsController < ApplicationController
  def new
    @workspace = Workspace.find(params[:workspace_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @workspace = Workspace.find(params[:workspace_id])
    @review.workspace = @workspace
    @review.user = current_user
    @review.save
    redirect_to workspace_path(@workspace)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
