module API
  class OrdersController < ApplicationController

    before_action :authenticate_user!
    skip_before_filter  :verify_authenticity_token

    def index
      @order_details = current_user.orders.first.order_details.includes(:bean).all
    end

    def create
      @order = current_user.orders.first_or_create()
      @bean = Bean.find(params[:bean_id])
      @detail = OrderDetail.new(order: @order, bean: @bean, quantity: params[:quantity])

      if @detail.save
        render json: @detail
      else
        render json: @detail.errors
      end
    end

    def show
      @order_details = current_user.orders.first.order_details.find(params[:id])
      render json: @order_details
    end

    # def update
    #   order = current_user.order
    #   if order.update_attributes(order_params)
    #     head 204
    #   else
    #     render json: order.errors, status: 422
    #   end
    # end

    def destroy
      @order_details = current_user.orders.first.order_details.find(params[:id])
      @order_details.destroy
      render json:({message: 'Successfully deleted'})
    end

    private
    # def order_details_params
    #   params.require(:order).permit(id: [:order_id, :bean_id, :quantity])
    # end

  end
end
