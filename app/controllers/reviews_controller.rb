class ReviewsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @property = Property.find(params[:property_id])
    @review = @property.reviews.new
  end

  def create
    @property = Property.find(params[:property_id])
    @review = @property.reviews.new(review_params)
   if @review.save
     current_user.reviews.push(@review)
     flash[:notice] = "Your review has been posted."
     redirect_to property_path(@property)
   else
     render :new
   end
 end

 def show
   @property = Property.find(params[:property_id])
   @review = Review.find(params[:id])
 end

 def edit
   @property = Property.find(params[:property_id])
   @review = Review.find(params[:id])
 end

 def update
   @property = Property.find(params[:property_id])
   @review = Review.find(params[:id])
   if @review.update(review_params)
     flash[:notice] = "Your review has been updated."
     redirect_to property_path(@property)
   else
     render :edit
   end
 end

 def destroy
   @property = Property.find(params[:property_id])
   @review = Review.find(params[:id])
   if current_user.admin?
     @review.destroy
     flash[:notice] = 'Deleted successfully'
     redirect_to property_path(@property)
   else
     flash[:notice] = "You don't have admin privileges."
     redirect_to property_path(@property)
   end
 end



 private
   def review_params
     params.require(:review).permit(:text)
   end
end
