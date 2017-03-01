class LivestreamsController < ApplicationController

  before_action :set_livestream, only: [:show]

  def index
    @livestreams = Livestream.search(params[:query])
  end

  def show
    @user = @livestream.user
    @chat_room = ChatRoom.includes(:messages).find_by(id: @livestream.chat_room)
    @message = Message.new
  end

  def new
    @livestream = Livestream.new
  end

  def create
    @livestream = Livestream.new(livestream_params)
    @livestream.user = current_user
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    @chat_room.title = "chat"
    @chat_room.save
    @livestream.chat_room = @chat_room.id
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

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end
