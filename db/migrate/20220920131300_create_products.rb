class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :status, default: 1
      t.integer :price
      t.boolean :new, default: false
      t.boolean :visible, default: false
      t.integer :code
      t.boolean :discount
      t.integer :discount_price
      t.text :specifications
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
