class AddColumnCodeToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :code, :string
    change_column :orders, :code, :string, null: false
    add_index :orders, :code, unique: true
  end
end
