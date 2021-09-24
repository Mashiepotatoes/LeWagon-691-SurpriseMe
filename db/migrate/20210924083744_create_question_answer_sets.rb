class CreateQuestionAnswerSets < ActiveRecord::Migration[6.0]
  def change
    create_table :question_answer_sets do |t|
      t.references :question, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
