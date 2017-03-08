class OrdersController < ApplicationController

  def show
    @order = Order.where(state: 'paid').find(params[:id])
  end


  def create

    pack = Order::PACKS[params[:pack].to_sym]
    @order  = Order.create!(rubies: pack[:rubies], amount: pack[:price], state: 'pending')

      customer = Stripe::Customer.create(
        source: params[:stripeToken],
        email:  params[:stripeEmail]
      )

      charge = Stripe::Charge.create(
        customer:     customer.id,   # You should store this customer id and re-use it.
        amount:       @order.amount_pennies, # or amount_pennies
        description:  "Payment for rubies #{@order.rubies} for order #{@order.id}",
        currency:     @order.amount.currency
      )

      @order.update(payment: charge.to_json, state: 'paid')
      current_user.balance += @order.rubies
      current_user.save
      redirect_to order_path(@order)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_order_payment_path(@order)
  end
end
