class ChangeIsActiveOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :is_active, default: false
  end
end
