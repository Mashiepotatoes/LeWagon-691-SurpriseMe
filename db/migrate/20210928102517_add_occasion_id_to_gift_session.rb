class AddOccasionIdToGiftSession < ActiveRecord::Migration[6.0]
  def change
    add_reference :gift_sessions, :occasions, null: false, foreign_key: true
  end
end
