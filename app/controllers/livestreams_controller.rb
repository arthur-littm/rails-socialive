class LivestreamsController < ApplicationController

  before_action :set_livestream, only: [:show]

  def index
    @livestreams = Livestream.search(params[:query])
  end

  def show
    @user = @livestream.user
    @messages = @livestream.messages
    @message = Message.new
  end

  def new
    @livestream = Livestream.new
  end

  def create
    @livestream = Livestream.new(livestream_params)
    @livestream.user = current_user
    @livestream = current_user.livestreams.build(livestream_params)
    @livestream.title = "chat"
    @livestream.save
    @livestream.livestream = @livestream.id
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

 private
  def livestream_params
    params.require(:livestream).permit(:title, :category)
  end

  def set_livestream
    @livestream = Livestream.find(params[:id])
  end

  def livestream_params
    params.require(:livestream).permit(:title)
  end
end
