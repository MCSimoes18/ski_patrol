class StudentsController < ApplicationController

  def index
    @mountains = []
    @mountains << Mountain.find(8, 10)
    @mountains = @mountains.flatten
    @student = Student.find(5)
  end

  def homepage
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    redirect_to students_path
  end

  def show
    @student = Student.find(params[:id])
  end


private

def student_params
  params.require(:student).permit(:name, :age, :level)

end

end
