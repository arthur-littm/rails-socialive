class ProductsController < ApplicationController


  # def index
  #   @product = Product.All
  # end

  def new
    @livestream = Livestream.find(params[:livestream_id])
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @livestream = Livestream.find(params[:livestream_id])
    @product.livestream = @livestream
    @product.user = current_user
    @product.save
    if @product.save
      redirect_to livestream_path(@livestream)
    else
      render :new
    end
  end

  def show
    @livestream = Livestream.find(params[:livestream_id])
  end

   private

  def product_params
    params.require(:product).permit(:title, :url, :price, :product_pic)
  end

end
