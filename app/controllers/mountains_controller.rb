class MountainsController < ApplicationController
  skip_before_action :instructor_authorized


  def show
    @mountain = Mountain.find(params[:id])
  end

end
