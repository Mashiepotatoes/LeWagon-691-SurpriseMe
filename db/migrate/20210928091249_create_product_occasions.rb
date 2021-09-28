class CreateProductOccasions < ActiveRecord::Migration[6.0]
  def change
    create_table :product_occasions do |t|
      t.references :products, foreign_key: true
      t.references :occasions, foreign_key: true

      t.timestamps
    end
  end
end
