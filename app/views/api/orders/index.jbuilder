json.array! @order_details do |order_detail|
  json.bean_id   order_detail.bean_id
  json.bean_name Bean.find(order_detail.bean_id).bean_name
  json.price     Bean.find(order_detail.bean_id).price
  json.order_id  order_detail.order_id
  json.quantity  order_detail.quantity
  json.order_detail_id  order_detail.id
end
