class AddCodeToFrames < ActiveRecord::Migration[6.0]
  def change
    add_column :frames, :code, :string
  end
end
