class ReviewsController < ApplicationController
  def create
    @restaurant = restaurant.find(params[:restaurant_id])
    @revew = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render "retaurants/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
