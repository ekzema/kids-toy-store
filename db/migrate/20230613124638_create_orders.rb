class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :patronymic
      t.string :email
      t.string :phone
      t.string :city
      t.text :note
      t.integer :pay_type
      t.integer :delivery
      t.integer :moderation, default: 0
      t.belongs_to :cart, foreign_key: true

      t.timestamps
    end
  end
end
