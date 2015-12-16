class AddColumn < ActiveRecord::Migration
  def change
    add_column :beans, :image, :string
  end
end
