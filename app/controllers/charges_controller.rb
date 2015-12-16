class ChargesController < ApplicationController

  def new
    @description = new_params[:description]
    @amount      = new_params[:amount]
  end

  def create
    begin
      # Amount in cents
      customer = Stripe::Customer.create(
        :email => params[:email],
        :source  => params[:token]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => params[:amount],
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
      )



      render json: {message: "Thanks, you paid $#{params[:amount]/100.00}!"}
    rescue Stripe::CardError => e
      render json: {error: e.message}
    end
  end

  private

  def new_params
    params.permit(:description, :amount)
  end
end
