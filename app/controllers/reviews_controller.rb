class ReviewsController < ApplicationController

  before_action :authenticate_user!

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end


  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.restaurant_id = @restaurant.id
    # @review = @restaurant.reviews.build_with_user review_params, current_user

  if @review.save
    redirect_to restaurants_path
  else
    if @review.errors[:user_id]
      redirect_to restaurants_path, alert: 'You have already reviewed this restaurant'
    else
      render :new
    end
  end
end

private

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end
end
