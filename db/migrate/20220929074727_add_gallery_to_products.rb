class AddGalleryToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :gallery, :json
  end
end
