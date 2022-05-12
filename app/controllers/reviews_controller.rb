class ReviewsController < ApplicationController
  before_action :current_user, only: [:create, :delete]

  def create
    
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to product_path(@product)
    else
      redirect_to product_path(@product)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(params[:product_id])
  end
  

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
  
end
