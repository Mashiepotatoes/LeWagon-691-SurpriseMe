class AddRecipientIdToRatings < ActiveRecord::Migration[6.0]
  def change
    add_reference :ratings, :recipient
    add_foreign_key :ratings, :users, column: :recipient_id, primary_key: :id
  end
end
