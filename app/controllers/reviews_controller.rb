class ReviewsController < ApplicationController
  # skip_before_action :student_authorized, only: [:new, :create]
  skip_before_action :instructor_authorized

  def new
    # byebug
    @instructor = Instructor.find_by(params[:instructor_id])
    @mountain = Mountain.find_by(params[:mountain_id])
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    @instructor = @review.instructor

    # byebug

    redirect_to instructor_reviews_path(@instructor)
  end

  private

  def review_params
    params.require(:review).permit(:mountain_id, :instructor_id, :student_id, :title, :description, :rating)
  end

end
