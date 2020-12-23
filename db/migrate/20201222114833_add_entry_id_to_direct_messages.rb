class AddEntryIdToDirectMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :direct_messages, :entry_id, :integer
  end
end
