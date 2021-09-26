class ChangeChoiceColumnTypeForAnswers < ActiveRecord::Migration[6.0]
  def change
    change_column :answers, :choice, :string
  end
end
