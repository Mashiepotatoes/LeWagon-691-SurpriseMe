class AddRecipientIdToRatings < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, null: false, foreign_key: true
    add_reference :gift_sessions, null: false, foreign_key: true
  end
end

# session id
# user_id