class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    render :new
  end

  def login_student
    @student = Student.find_by(username: params[:username])
    if @student && @student.authenticate(params[:password])
      session[:student_id] = @student.id
      redirect_to @student
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
    session[:student_id] = nil
    flash[:notice] = "Goodbye! You have logged out."
    redirect_to login_path
  end



end #end of class
