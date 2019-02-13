class ApplicationController < ActionController::Base
  before_action :student_authorized, :instructor_authorized
  # before_action :instructor_authorized
  # before_action :instructor_authorized
  helper_method :current_student
  helper_method :current_instructor

  # def current_somebody(somebody)
  #   classify = somebody.capitzalize
  #   classify.find_by
  #
  # end


  def current_student
    Student.find_by({id: session[:student_id]})
  end

  def current_instructor
    Instructor.find_by({id: session[:instructor_id]})
  end

  def student_logged_in?
    !!current_student
  end

  def instructor_logged_in?
    !!current_instructor
  end

  def student_authorized
    redirect_to login_path unless student_logged_in?
  end

  def instructor_authorized
    redirect_to login_path unless instructor_logged_in?
  end


end #end of class
