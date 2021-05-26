class ReviewsController < ApplicationController
  before_action :set_restaurant, except: [:destroy]

  # GET /restaurants/:restaurant_id/reviews/new
  def new
    @review = Review.new
  end

  # POST /restaurants/:restaurant_id/reviews
  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save # true / false
      redirect_to restaurant_path(@restaurant)
    else
      render :new # render the new.html.erb view
    end
  end

  # If it was nested --> DELETE /restaurants/:restaurant_id/reviews/:id
  # DELETE /reviews/:id
  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
