class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.references :order
      t.references :bean
      t.integer  :quantity
      t.string  :status
      t.timestamps null: false
    end
  end
end
