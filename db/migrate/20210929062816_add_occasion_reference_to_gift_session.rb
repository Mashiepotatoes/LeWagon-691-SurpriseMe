class AddOccasionReferenceToGiftSession < ActiveRecord::Migration[6.0]
  def change
    add_reference :gift_sessions, :occasion, null: false, foreign_key: true
  end
end
