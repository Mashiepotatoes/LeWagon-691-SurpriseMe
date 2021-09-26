class AddParentAndDependencyColumnsToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :parent, :integer
    add_column :questions, :dependency, :integer
  end
end
