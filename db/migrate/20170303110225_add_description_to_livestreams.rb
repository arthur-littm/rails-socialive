class AddDescriptionToLivestreams < ActiveRecord::Migration[5.0]
  def change
    add_column :livestreams, :description, :text
  end
end
