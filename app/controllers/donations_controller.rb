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
      redirect_to livestream_path(@livestream)
    else
      redirect_to livestream_path(@livestream), alert: "You have insufficient rubies"
    end
  end
end
