class LivestreamsController < ApplicationController
  before_action :set_livestream, only: [:show]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_livestream
    @livestream = Livestream.find(params[:id])
  end
end
