class AddColumnProductsInfoToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :products_info, :text
  end
end
