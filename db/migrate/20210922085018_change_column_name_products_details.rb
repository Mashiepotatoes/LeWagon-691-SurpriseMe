class ChangeColumnNameProductsDetails < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :details, :description
  end
end
