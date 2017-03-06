class OrdersController < ApplicationController

  def show
    @order = Order.where(state: 'paid').find(params[:id])
  end


  def create

    pricing = { pack1: 10,
                pack2: 20,
                pack3: 40}

    no_of_rubies = { pack1: 100,
                pack2: 200,
                pack3: 500}

    @pack = params[:pack]

    order  = Order.create!(rubies: no_of_rubies[@pack.to_sym] ,amount: pricing[@pack.to_sym], state: 'pending')

    redirect_to new_order_payment_path(order)
  end
end
