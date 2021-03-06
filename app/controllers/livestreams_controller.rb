class LivestreamsController < ApplicationController

  require 'opentok'

  before_action :set_livestream, only: [:show, :flop, :flop_start, :status]
  skip_before_action :authenticate_user!, only: [ :show, :category_show ]


  def index
    #@livestreams = Livestream.search params[:query]
    @livestreams = Livestream.search params[:query], operator: "or", match: :word_start, fields: [:title, :description, :category], highlight: {tag: "<strong>"}
    @users = User.search(params[:query])
    #@users = User.all
  end

  def show

    api_key = ENV['API_KEY']
    api_secret = ENV['API_SECRET']

    opentok = OpenTok::OpenTok.new api_key, api_secret
    @livestream = Livestream.find(params[:id])
    @tok_token = opentok.generate_token @livestream.sessionId

    # @tok_token = @livestream.generate_token
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
    params.require(:livestream).permit(:title, :category, :main_picture, :tickets_available, :hour_of_stream, :ticket_price, :description, :donation_feature, :sessionId, :free_livestream)
  end

  def set_livestream
    @livestream = Livestream.find(params[:id])
  end

end
