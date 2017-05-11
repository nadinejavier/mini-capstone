class AddStockStatusToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :stock, :boolean, default: true
  end
end
