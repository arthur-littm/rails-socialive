class ProfilesController < ApplicationController

  def index
    @users = User.all
  end


  def show
    @user = User.find(params[:id])
    @livestreams = Livestream.where(user: @user)
    @ticket = Ticket.new
  end

end
