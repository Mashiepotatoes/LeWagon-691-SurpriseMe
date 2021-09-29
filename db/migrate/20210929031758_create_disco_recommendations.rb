class CreateDiscoRecommendations < ActiveRecord::Migration[6.0]
  def change
    create_table :disco_recommendations do |t|
      t.references :subject, polymorphic: true
      t.references :item, polymorphic: true
      t.string :context
      t.float :score
      t.timestamps
    end
  end
end
