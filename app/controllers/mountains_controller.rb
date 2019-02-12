class MountainsController < ApplicationController


  def show
    @mountain = Mountain.find(params[:id])
  end

end
