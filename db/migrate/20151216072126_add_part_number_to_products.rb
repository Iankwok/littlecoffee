class AddPartNumberToProducts < ActiveRecord::Migration
  def change
    add_column :orders, :status, :string
    remove_column :order_details, :status, :string
    change_column :beans, :price, :float
  end
end
