class DropQuestionandanswersetsAndAnswersTables < ActiveRecord::Migration[6.0]
  def change
    drop_table :answers, force: :cascade
    drop_table :question_answer_sets
  end
end
