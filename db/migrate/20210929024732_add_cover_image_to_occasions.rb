class AddCoverImageToOccasions < ActiveRecord::Migration[6.0]
  def change
    add_column :occasions, :cover_image, :string
  end
end
