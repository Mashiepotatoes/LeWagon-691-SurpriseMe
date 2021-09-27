class RemoveFriendshipAssociationFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :reviews, column: :friendship_id
  end
end
