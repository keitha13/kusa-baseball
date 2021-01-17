class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ball_speed, :string
    add_column :users, :control, :string
    add_column :users, :stamina, :string
  end
end
