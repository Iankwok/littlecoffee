class Bean < ActiveRecord::Base
  belongs_to :orders
  has_many :order_details
end
