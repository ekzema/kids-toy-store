class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.index :user_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
