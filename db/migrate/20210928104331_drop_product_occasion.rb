class DropProductOccasion < ActiveRecord::Migration[6.0]
  def change
    drop_table :product_occasions
  end
end
