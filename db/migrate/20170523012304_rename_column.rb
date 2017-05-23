class RenameColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :carted_products, :product_id, :item_id
  end
end
