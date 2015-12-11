module API
  class BeansController < ApplicationController
    # before_action :authericate_user!
    def index
      render json: Bean.all
    end
  end
end