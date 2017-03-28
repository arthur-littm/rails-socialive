class LivestreamsController < ApplicationController

  before_action :set_livestream, only: [:show, :flop, :flop_start, :status]

  def index

    @livestreams = Livestream.search params[:query]
    #@livestreams = Livestream.search params[:query], operator: "or", match: :word_start, fields: [:title, :description], highlight: {tag: "<strong>"}
    #@users = User.search(params[:query])
    @users = User.all
  end

  def show
    @user = @livestream.user
    @livestreams = Livestream.where(user: @user)
    @messages = @livestream.messages
    @message = Message.new
    @ticket = Ticket.new
    @question = Question.new
    @donation = Donation.new
    @product = Product.new
  end

  def status
    live = @livestream.live
    render json: live
  end

  def new
    @livestream = Livestream.new
  end

  def create
    @livestream = Livestream.new(livestream_params)
    @livestream.user = current_user
    @livestream = current_user.livestreams.build(livestream_params)
    @livestream.save
    # @livestream.livestream = @livestream.id
    if @livestream.save
      redirect_to livestream_path(@livestream)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def category_show
    @livestreams = Livestream.all.where(category: params[:category])
  end

  # def following
  #   @title = "Following"
  #   @users = @user.following
  #   render following_path
  # end

  # def followers
  #   @title = "Followers"
  #   @users = @user.followers
  #   render followers_path
  # end

  def flop
    @livestream.ended = true
    @livestream.live = false

    @livestream.save
    redirect_to livestream_path(@livestream)
  end

  def flop_start
    @livestream.ended = false
    @livestream.live = true

    @livestream.save
    redirect_to livestream_path(@livestream)
  end

 private
  def livestream_params
    params.require(:livestream).permit(:title, :category, :main_picture, :tickets_available, :hour_of_stream, :ticket_price, :description, :donation_feature)
  end

  def set_livestream
    @livestream = Livestream.find(params[:id])
  end
end
