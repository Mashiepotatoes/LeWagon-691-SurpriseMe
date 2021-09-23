class CreateGiftRecommendations < ActiveRecord::Migration[6.0]
  def change
    create_table :gift_recommendations do |t|
      t.references :product, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :recipient

      t.timestamps
    end
    add_foreign_key :gift_recommendations, :users, column: :recipient_id, primary_key: :id
  end
end
