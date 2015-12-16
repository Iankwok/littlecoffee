class CreateBeans < ActiveRecord::Migration
  def change
    create_table :beans do |t|
      t.string :bean_name
      t.string :flavours
      t.string :description
      t.integer :weight
      t.integer :price
      t.boolean :stock

      t.timestamps null: false
    end
  end
end
