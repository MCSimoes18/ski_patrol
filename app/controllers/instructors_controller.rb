class InstructorsController < ApplicationController

def index
  @instructor = Instructor.find_by(name: params[:name])
  redirect_to @instructor
end

def new
  @instructor = Instructor.new
end

def create
  @instructor = Instructor.create(instructor_params)
  redirect_to @instructor
end

def show
  @instructor = Instructor.find(params[:id])
end

private

def instructor_params
  params.require(:instructor).permit(:name, :experience, :rate, :img)
end



end #end of class
