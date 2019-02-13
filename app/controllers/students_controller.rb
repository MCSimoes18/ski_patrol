class StudentsController < ApplicationController
  skip_before_action :student_authorized, only: [:new, :create]
  skip_before_action :instructor_authorized
  helper_method :current_student

  def index
    # @mountains = []
    # @mountains << Mountain.find(6, 9)
    # @mountains = @mountains.flatten
    @mountains = Mountain.all
    # @student = Student.find(1)
    @student = Student.find(session[:student_id])
  end

  # def homepage
  # end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
      if @student.save
        session[:student_id] = @student.id
        redirect_to students_path
      else
        flash[:errors] = @student.errors.full_messages
        redirect_to new_student_path
      end
  end

  def show
    if !!current_student
      if current_student == Student.find(params[:id])
        @student = Student.find(params[:id])
        render :show
      else
        redirect_to current_student
      end
    else
      redirect_to login_path
    end
  end

  def edit
    @student = current_student
  end

  def update
    @student = current_student

    if @student.update(student_params)
      redirect_to @student
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to edit_student_path
    end
  end


private

def student_params
  params.require(:student).permit(:name, :age, :level, :username, :password)

end

end
