class CreateGameSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :game_sessions do |t|
      t.integer :answers, array: true, default: []
      t.integer :check_point
      t.integer :total_weight

      t.belongs_to :frame, foreign_key: true
      t.belongs_to :survey, null: false, foreign_key: true

      t.timestamps
    end
  end
end
