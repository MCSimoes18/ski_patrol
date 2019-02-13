class BookingsController < ApplicationController
  skip_before_action :instructor_authorized

  def new
    # byebug
    @booking = Booking.new
    # byebug
    @instructor = Instructor.find(params[:instructor_id])
    @mountain = Mountain.find(params[:mountain_id])
    @mountain_instructor = MountainInstructor.find_by(mountain_id: params[:mountain_id], instructor_id: params[:instructor_id])
    @duration_arr = @booking.duration_arr
  end

  def create
    byebug
    if params[:booking][:book_time] == nil
      byebug
        # error = ["Errrorrr"]
        # flash[:errors][:book_time] = error
        # byebug
        # flash[:instructor_id] =
        redirect_to new_booking_path, params[:booking][:instructor_id] = params[:instructor_id], params[:booking][:mountain_id] = params[:mountain_id]
    else
      @booking = Booking.create(booking_params)
        if @booking.save?
          redirect_to @booking.student
        else
          flash[:errors] = @booking.errors.full_messages
          redirect_to new_booking_path, instructor_id: params[:instructor_id], mountain_id: params[:mountain_id]
        end
      end
    end

  #       redirect_to @booking.student
  #     else
  #       byebug
  #       flash[:errors] = @booking.errors.full_messages
  #       redirect_to new_booking_path
  #     end
  #   else
  #     redirect_to new_booking_path
  # end

  def destroy
    byebug
    @booking = Booking.find(params[:id])
    @booking.delete

    redirect_to current_student
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
