class SessionsController < ApplicationController
  skip_before_action :student_authorized, only: [:new, :login_student, :login_instructor, :destroy]
  skip_before_action :instructor_authorized, only: [:new, :login_student, :login_instructor, :destroy]

  def new
    render :new
  end

  def login_student
    @student = Student.find_by(username: params[:username])
    if @student && @student.authenticate(params[:password])
      session[:student_id] = @student.id
      redirect_to students_path
    else
      flash[:notice] = "Invalid Username or Password"
      redirect_to login_path
    end
  end

  def login_instructor
    @instructor = Instructor.find_by(username: params[:username])
    if @instructor && @instructor.authenticate(params[:password])
      session[:instructor_id] = @instructor.id
      redirect_to @instructor
    else
      flash[:notice] = "Invalid Username or Password"
      redirect_to login_path
    end
  end

  def destroy
    # byebug
    # session.delete(:user_id)
    if session[:student_id]
      session[:student_id] = nil
      flash[:notice] = 'u logged out'
      redirect_to login_path
    else
      session[:instructor_id] = nil
      flash[:notice] = 'u logged out'
      redirect_to login_path
    end
  end

  # def destroy_instructor
  #   session[:student_id] = nil
  #   flash[:notice] = "Goodbye! You have logged out."
  #   redirect_to login_path
  # end


end #end of class
