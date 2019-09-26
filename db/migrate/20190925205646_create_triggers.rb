class CreateTriggers < ActiveRecord::Migration[6.0]
  def change
    create_table :triggers do |t|
      t.string :type
      t.json :condition
      t.belongs_to :frame, null: false, foreign_key: true

      t.timestamps
    end
  end
end
