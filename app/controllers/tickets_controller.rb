class TicketsController < ApplicationController
  def create

    @livestream = Livestream.find(params[:livestream_id])

    #checks if user has enough rubies to buy ticket and debits/credits if he does
    if current_user.balance >= @livestream.ticket_price && (@livestream.tickets_available - @livestream.tickets_sold) > 0
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
      @livestream.tickets_sold += 1
      @livestream.save
      #redirects
      respond_to do |format|
        format.html { redirect_to livestream_path(@livestream) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    elsif current_user.balance >= @livestream.ticket_price
      redirect_to livestream_path(@livestream), alert: "Tickets are sold out"
    else
      respond_to do |format|
        format.html { redirect_to buy_rubies_path, alert: "You have insufficient rubies" }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    end
  end
end
