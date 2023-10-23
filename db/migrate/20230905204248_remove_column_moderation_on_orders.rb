class RemoveColumnModerationOnOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :moderation
  end
end
