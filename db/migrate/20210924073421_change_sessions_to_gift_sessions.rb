class ChangeSessionsToGiftSessions < ActiveRecord::Migration[6.0]
  def change
    rename_table :sessions, :gift_sessions
  end
end
