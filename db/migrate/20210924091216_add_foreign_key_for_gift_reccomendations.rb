class AddForeignKeyForGiftReccomendations < ActiveRecord::Migration[6.0]
  def change
    add_reference :gift_recommendations, :gift_session, index: true
  end
end
