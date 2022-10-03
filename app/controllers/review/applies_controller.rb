module Review
  class AppliesController < ApplicationController

    def show
      @reviews = UserReview.order(created_at: :desc)
    end

    def add
      @review = UserReview.new(user_review_params)
      @review.save!
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
end
