class ReviewsController < ApplicationController

def new
   @restaurant = Restaurant.find(params[:restaurant_id])
   if current_user.reviewer_of?(@restaurant)
     flash[:alert] = 'Cannot re-review restaurant'
     redirect_to restaurants_path
   else
     @review = Review.new
   end
 end

  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    restaurant.build_review(review_params, current_user)
    redirect_to restaurants_path
  end

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end
end
