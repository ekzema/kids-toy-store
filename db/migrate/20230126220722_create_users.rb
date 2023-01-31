class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :patronymic
      t.string :email
      t.string :phone
      t.boolean :admin, default: false
      t.string :password_digest
      t.datetime :confirmed_at
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :users, :email
  end
end
