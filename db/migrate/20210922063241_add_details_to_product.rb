class AddDetailsToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :details, :string
  end
end
