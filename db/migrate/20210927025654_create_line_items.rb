class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.integer :quantity, default: 1
      t.references :product
      t.references :cart
      t.references :order

      t.timestamps
    end
  end
end
