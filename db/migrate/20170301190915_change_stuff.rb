class ChangeStuff < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :chat_room_id, :integer
    drop_table :chat_rooms
  end
end
