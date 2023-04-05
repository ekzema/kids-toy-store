class AddForeignKeyToProductCategoriesAndProductImages < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :product_categories, :products
    add_foreign_key :product_categories, :categories
    add_foreign_key :product_images, :products
  end
end
