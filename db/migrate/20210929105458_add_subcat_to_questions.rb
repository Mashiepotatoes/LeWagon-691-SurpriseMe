class AddSubcatToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :subcategory, :string
  end
end
