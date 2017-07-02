class ProductsController < ApplicationController


before_action :set_product, only: :destroy

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

  def destroy
    @product.destroy
    redirect_to livestream_path(@livestream)
  end

   private

  # def set_livestream
  #   @livestream = Livestream.find(params[:livestream_id])
  # end

  def set_product
    @livestream = Livestream.find(params[:livestream_id])
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :url, :price, :brand, :product_pic)
  end

end
