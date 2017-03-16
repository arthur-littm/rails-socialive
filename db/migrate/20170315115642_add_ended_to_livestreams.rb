class AddEndedToLivestreams < ActiveRecord::Migration[5.0]
  def change
    add_column :livestreams, :ended, :boolean, default: false
  end
end
