class RemoveOccasionIdInGiftSession < ActiveRecord::Migration[6.0]
  def change
    remove_reference :gift_sessions, :occasions, null: false, foreign_key: true
  end
end
