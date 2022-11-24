class ChangeColumnDiscountInProducts < ActiveRecord::Migration[7.0]
  def change
    change_column_default :products, :discount, false
  end
end
