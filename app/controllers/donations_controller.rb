class DonationsController < ApplicationController
  def create
    @livestream = Livestream.find(params[:livestream_id])

    if current_user.balance >= params[:donation][:rubies_donated].to_i
      #this creates the donation
      @donation = Donation.new
      @donation.livestream = @livestream
      @donation.user = current_user
      @donation.rubies_donated = params[:donation][:rubies_donated].to_i
      @donation.save
      #then we debit the amout from the user's account
      #and add it to the streamer's earned_balance
      current_user.balance -= @donation.rubies_donated
      @livestream.user.earned_balance += @donation.rubies_donated
      current_user.save
      @livestream.user.save
      #now we make a message to display in the chat
      @message = Message.new
      @message.livestream = @livestream
      @message.user = current_user #this will have to be an account with username ADMIN and a special ICON
      @message.body = "#{current_user.first_name.capitalize} donated #{@donation.rubies_donated} rubies"
      @message.donation = true
      @message.save
      respond_to do |format|
       format.html { redirect_to livestream_path(@livestream) }
       format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      redirect_to buy_rubies_path, alert: "You have insufficient rubies"
    end
  end
end

