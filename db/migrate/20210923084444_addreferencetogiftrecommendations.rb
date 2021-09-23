class Addreferencetogiftrecommendations < ActiveRecord::Migration[6.0]
  def change
    add_reference :gift_recommendations, :session, index: true
  end
end
