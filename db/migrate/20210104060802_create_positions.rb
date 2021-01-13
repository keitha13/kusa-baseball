class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      
      t.integer "user_id"
      t.string "position"

      t.timestamps
    end
  end
end
