class AddSubcatToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :subcategory, :string
  end
end
