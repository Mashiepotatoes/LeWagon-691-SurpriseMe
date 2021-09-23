class RemoveReferences < ActiveRecord::Migration[6.0]
  def change
    remove_reference :gift_recommendations, :user
    remove_reference :gift_recommendations, :recipient
  end
end
