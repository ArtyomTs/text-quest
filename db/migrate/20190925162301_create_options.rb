class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options do |t|
      t.string :text
      t.string :code
      t.integer :weight
      t.belongs_to :frame, null: false, foreign_key: true

      t.timestamps
    end
  end
end
