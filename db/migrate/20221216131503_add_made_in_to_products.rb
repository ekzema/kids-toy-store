class AddMadeInToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :production_country, :integer
    add_column :products, :for_gender, :integer
    add_column :products, :brand_id, :integer
    add_column :products, :for_age, :integer
  end
end
