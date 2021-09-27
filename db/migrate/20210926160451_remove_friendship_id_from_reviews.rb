class RemoveFriendshipIdFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :friendship_id, :bigint
  end
end
