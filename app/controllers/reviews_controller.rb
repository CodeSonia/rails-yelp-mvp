# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[new create]
  def new
    # @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      # render :new, status: :unprocessable_entity
      render 'restaurants/show'
    end

  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
