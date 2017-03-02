class AddRoomNameToLivestreams < ActiveRecord::Migration[5.0]
  def change
    add_column :livestreams, :room_name, :string
  end
end
