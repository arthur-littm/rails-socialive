class TicketsController < ApplicationController
  def create

    @livestream = Livestream.find(params[:livestream_id])

    #checks if user has enough rubies to buy ticket and debits/credits if he does
    if current_user.balance >= @livestream.ticket_price
      current_user.balance -= @livestream.ticket_price
      @livestream.user.earned_balance += @livestream.ticket_price
      current_user.save
      @livestream.user.save
      #creates the ticket
      @ticket = Ticket.new
      @ticket.user = current_user
      @ticket.livestream = @livestream
      @ticket.save
      #updates Tickets sold in the livestream table
      @livestream.tickets_sold -= 1
      @livestream.save
      #redirects
      redirect_to livestream_path(@livestream)
    else
      redirect_to livestream_path(@livestream), alert: "You have insufficient funds"
    end
  end
end
