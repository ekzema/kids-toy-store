class RemoveColumnWishlistsCountInUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :wishlists_count
  end
end
