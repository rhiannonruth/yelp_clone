module ReviewHelpers

  def link_review_with_restaurant_and_user(review, restaurant, user)
    review.restaurant = restaurant
    review.user = user
    review.save
  end

end
