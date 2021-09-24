class RenameForeignKeyForGiftReccomendations < ActiveRecord::Migration[6.0]
  def change
    remove_reference :gift_recommendations, :session, index: true
  end
end
 
