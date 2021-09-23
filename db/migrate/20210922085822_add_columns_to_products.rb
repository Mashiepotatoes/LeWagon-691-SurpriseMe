class AddColumnsToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :asin, :string
    add_column :products, :image_url, :string
    add_column :products, :brand, :string
  end
end
