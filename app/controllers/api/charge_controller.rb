module API
  class ChargeController < ApplicationController
    def new
      @description = new_params[:description]
      @amount      = new_params[:amount]
    end

    def create
      order = current_user.orders.find_by(status: nil)

      begin
        customer = Stripe::Customer.create(
          :email => params[:stripeEmail],
          :source  => params[:stripeToken]
        )

        charge = Stripe::Charge.create(
          :customer    => customer.id,
          :amount      => new_params[:amount],
          :description => 'Rails Stripe customer',
          :currency    => 'usd'
        )
      rescue Stripe::CardError => e
        redirect_to "http://localhost:3000/#/checkout?error=" + e.to_s
      end

      # here update order status
      order.update(status: "PAID")

      redirect_to "http://localhost:3000/#/orders"
    end

    private

    def new_params
      params.permit(:description, :amount)
    end
  end
end