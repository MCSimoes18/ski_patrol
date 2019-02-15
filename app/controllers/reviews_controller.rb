class ReviewsController < ApplicationController
  skip_before_action :student_authorized, only: [:new, :create]
  skip_before_action :instructor_authorized

  def new
    # byebug
    @instructor = Instructor.find_by(params[:instructor_id])
    @mountain = Mountain.find_by(params[:mountain_id])
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    # @instructor = @review.instructor
    # byebug
    if @review.save
      # redirect_to instructor_reviews_path(@instructor)
      # redirect_to "/instructors/#{@instructor.id}/reviews"
      redirect_to "/instructors/#{params[:review][:instructor_id]}/reviews"
    else
      # byebug
      flash[:errors] = @review.errors.full_messages
      # redirect_to "/instructors/#{params[:instructor_id]}/reviews"
      redirect_to "/reviews/new?instructor_id=#{params[:review][:instructor_id]}&mountain_id=#{params[:review][:mountain_id]}"
  end
end

  private

  def review_params
    params.require(:review).permit(:mountain_id, :instructor_id, :student_id, :title, :description, :rating)
  end

end
