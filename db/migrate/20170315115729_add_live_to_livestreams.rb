class AddLiveToLivestreams < ActiveRecord::Migration[5.0]
  def change
    add_column :livestreams, :live, :boolean, default: false
  end
end
