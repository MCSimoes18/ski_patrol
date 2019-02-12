class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @instructor = Instructor.find(params[:instructor_id])
    @mountain = Mountain.find(params[:mountain_id])
    @mountain_instructor = MountainInstructor.find_by(mountain_id: params[:mountain_id], instructor_id: params[:instructor_id])
    @duration_arr = @booking.duration_arr
  end

  def create
    @booking = Booking.create(booking_params)
    redirect_to @booking.student
  end

  def show
  end


  private

  def booking_params
    year = params["time_booked"]["book_time(1i)"].to_i
    month = params["time_booked"]["book_time(2i)"].to_i
    day = params["time_booked"]["book_time(3i)"].to_i
    hour = params["time_booked"]["book_time(4i)"].to_i
    minute = params["time_booked"]["book_time(5i)"].to_i

    params[:booking][:book_time] = DateTime.new(year,month,day,hour,minute)
    params[:booking][:duration] = params["booking"]["duration"].to_i
    params[:booking][:mountain_instructor_id] = params[:booking][:mountain_instructor_id].to_i
    params.require(:booking).permit(:mountain_instructor_id, :mountain_id, :duration, :book_time, :student_id)
  end

end
