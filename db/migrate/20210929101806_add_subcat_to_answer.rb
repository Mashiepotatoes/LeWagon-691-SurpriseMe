class AddSubcatToAnswer < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :subcategory, :string
  end
end
