class UserReviewsController < ApplicationController

  def index
    @reviews = UserReview.order(created_at: :desc)
  end

  def create
    @review = UserReview.new(user_review_params)
    @review.save!
  end

  def destroy
    @review = UserReview.find(params[:id])
    @review.destroy
  end

  private

  def user_review_params
    params.require(:user_review).permit(
      :author,
      :content,
      :rating,
    )
  end

end
