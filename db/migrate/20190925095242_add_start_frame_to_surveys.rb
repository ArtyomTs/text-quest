class AddStartFrameToSurveys < ActiveRecord::Migration[6.0]
  def change
    add_column :surveys, :start_frame_id, :integer, null: true, index: true
    add_foreign_key :surveys, :frames, column: :start_frame_id
  end
end
