class AddIndexToNameInCategories < ActiveRecord::Migration[7.0]
  def change
    add_index :categories, :name, unique: true
    add_index :brands, :name, unique: true
  end
end
