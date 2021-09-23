class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.integer :budget
      t.references :order, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :recipient

      t.timestamps
    end
    add_foreign_key :sessions, :users, column: :recipient_id, primary_key: :id
  end
end
