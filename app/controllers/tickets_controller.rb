class TicketsController < ApplicationController
  def create
    @ticket = Ticket.new
    @livestream = Livestream.find(params[:livestream_id])
    @ticket.user = current_user
    @ticket.livestream = @livestream
    @ticket.save
    redirect_to livestream_path(@livestream)
  end
end
