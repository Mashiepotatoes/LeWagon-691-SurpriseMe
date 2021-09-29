class RemoveAndAddColumnsToRatings < ActiveRecord::Migration[6.0]
  def change
    remove_reference :ratings, :orders
    add_reference :ratings, :product
  end
end
