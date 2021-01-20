class AddSomeColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :new_active_area, :integer
    add_column :users, :new_position, :integer
    add_column :users, :new_meet, :integer
    add_column :users, :new_power, :integer
    add_column :users, :new_run_speed, :integer
    add_column :users, :new_arm, :integer
    add_column :users, :new_defense, :integer
    add_column :users, :new_catch, :integer
    add_column :users, :new_control, :integer
    add_column :users, :new_stamina, :integer
  end
end
