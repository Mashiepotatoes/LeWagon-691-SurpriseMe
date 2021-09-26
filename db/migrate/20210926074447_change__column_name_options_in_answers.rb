class ChangeColumnNameOptionsInAnswers < ActiveRecord::Migration[6.0]
  def change
    rename_column :answers, :options, :choice
  end
end
