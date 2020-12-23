class ChangeDataDateToPost < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :date, :date
  end
end
