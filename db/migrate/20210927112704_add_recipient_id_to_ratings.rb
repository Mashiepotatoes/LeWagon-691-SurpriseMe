class AddRecipientIdToRatings < ActiveRecord::Migration[6.0]
  def change
    add_reference :ratings, :recipient, foreign_key: true
  end
end
