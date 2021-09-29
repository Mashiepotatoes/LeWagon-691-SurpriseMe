class ProductOccasions < ActiveRecord::Migration[6.0]
  def change
    create_table :product_occasion do |t|
    t.references :product, foreign_key: true
    t.references :occasion, foreign_key: true

    t.timestamps
    end
  end
end
