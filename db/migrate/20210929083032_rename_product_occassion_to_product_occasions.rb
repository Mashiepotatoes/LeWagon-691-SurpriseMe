class RenameProductOccassionToProductOccasions < ActiveRecord::Migration[6.0]
  def change
    rename_table :product_occasion, :product_occasions
  end
end
