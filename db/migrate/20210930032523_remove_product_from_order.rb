class RemoveProductFromOrder < ActiveRecord::Migration[6.0]
  def change
    remove_reference :orders, :product,foreign_key: true
  end
end
