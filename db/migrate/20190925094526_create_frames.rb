class CreateFrames < ActiveRecord::Migration[6.0]
  def change
    create_table :frames do |t|
      t.string :title
      t.text :content
      t.boolean :is_final, defauld: false
      t.boolean :is_success, defauld: false
      t.boolean :is_check_point, defauld: false
      t.belongs_to :survey, null: false, foreign_key: true

      t.timestamps
    end
  end
end
