class AddReferenceToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :product, foreign_key: true
  end
end
