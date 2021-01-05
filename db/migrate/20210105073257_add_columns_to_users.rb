class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :meet, :string
    add_column :users, :power, :string
    add_column :users, :run_speed, :string
    add_column :users, :arm, :string
    add_column :users, :defense, :string
    add_column :users, :catch, :string
  end
end
