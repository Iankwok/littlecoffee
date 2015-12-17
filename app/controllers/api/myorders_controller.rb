module API
  class MyordersController < ApplicationController
    before_action :authenticate_user!

    def index
      # @order_details = current_user.orders.find_by(status: "PAID").order_details.includes(:bean).all
      @order_details = current_user.orders.find_by(status: nil).order_details.includes(:bean).all
    end
  end
end
