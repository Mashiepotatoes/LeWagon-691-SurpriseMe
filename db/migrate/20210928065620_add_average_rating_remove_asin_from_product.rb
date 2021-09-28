class AddAverageRatingRemoveAsinFromProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :average_rating, :decimal, :precision => 2, :scale => 1
    remove_column :products, :asin, :string
  end
end
