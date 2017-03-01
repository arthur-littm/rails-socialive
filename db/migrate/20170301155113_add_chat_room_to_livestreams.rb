class AddChatRoomToLivestreams < ActiveRecord::Migration[5.0]
  def change
    add_column :livestreams, :chat_room, :integer
  end
end
