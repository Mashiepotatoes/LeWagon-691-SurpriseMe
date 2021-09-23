class Addquantitytogiftrecommendations < ActiveRecord::Migration[6.0]
  def change
    add_column :gift_recommendations, :quantity, :integer
  end
end
