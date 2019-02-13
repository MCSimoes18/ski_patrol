class InstructorsController < ApplicationController
  # before_action :instructor_authorized
  skip_before_action :student_authorized
  skip_before_action :instructor_authorized, only: [:new, :index, :create]
  helper_method :current_instructor

  def index
    # byebug
    # @instructor = Instructor.find(session[:instructor_id])
    # @instructor = Instructor.find_by(name: params[:name])
    redirect_to create_instructor_path
  end

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.create(instructor_params)
    session[:instructor_id] = @instructor.id
    @instructor.mountains=params[:instructor][:mountains]
    if @instructor.save
      redirect_to @instructor
    else
      flash[:errors] = @instructor.errors.full_messages
      redirect_to new_instructor_path
    end
  end

  def edit
    @instructor = current_instructor
  end

  def update
    @instructor = current_instructor
    if @instructor.update(instructor_params)
      @instructor.mountain_instructors.delete_all
      @instructor.mountains=params[:instructor][:mountains]
      redirect_to @instructor
    else
      flash[:errors] = @instructor.errors.full_messages
      redirect_to edit_instructor_path
    end
  end

  def show
    # byebug
    if !!current_instructor
      if current_instructor == Instructor.find(params[:id])
        @instructor = Instructor.find(params[:id])
        render :show
      else
        redirect_to current_instructor
      end
    else
      redirect_to login_path
    # byebug
    end
  end

  def destroy # DELETE request /users/:id
    @instructor = Instructor.find(params[:id])
    @instructor.destroy
    flash[:notice] = 'You deleted ur account. YEET!'
    redirect_to login_path
  end

  def reviews
    @instructor = Instructor.find_by(id: params[:id])
    render :reviews
  end

  private

  def instructor_params
    params.require(:instructor).permit(:name, :experience, :rate, :img, :username, :password, :mountains)
  end



end #end of class
