class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.references :gift_session, foreign_key: true
      t.timestamps
    end
  end
end
