class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :cart, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :patronymic
      t.string :email
      t.string :phone
      t.string :city
      t.text :note
      t.integer :pay_type
      t.integer :delivery
      t.string :department_number
      t.boolean :moderation, default: false

      t.timestamps
    end
  end
end
