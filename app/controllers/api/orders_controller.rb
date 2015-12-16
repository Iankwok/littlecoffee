module API
  class OrdersController < ApplicationController
    before_action :authenticate_user!
    # before_action :set_order_details

    def index
      # @order_details = @order.order_details.includes(:bean).all
      @order_details = current_user.orders.find_by(status: nil).order_details.includes(:bean).all
    end

    def create
      @order = current_user.orders.find_or_create_by(status: nil)
      @bean = Bean.find(params[:bean_id])
      @detail = OrderDetail.find_by(order: @order, bean: @bean)
      if @detail.nil?
        @detail = OrderDetail.new(order: @order, bean: @bean, quantity: params[:quantity])
      else
        @detail.assign_attributes(quantity: params[:quantity])
      end

      if @detail.save
        render json: @detail
      else
        render json: @detail.errors
      end
    end

    def destroy
      @order_details = current_user.orders.first.order_details.find(params[:id])
      @order_details.destroy
      render json:({message: 'Successfully deleted'})
    end

    def show
      @order_details = current_user.orders.first.order_details.find(params[:id])
      render json: @order_details
    end

    private

    # def set_order_details
    #   @order = current_user.orders.find_by(status: nil)
    #   if @order.nil?
    #     render json: []
    #   end
    # end
  end
end
