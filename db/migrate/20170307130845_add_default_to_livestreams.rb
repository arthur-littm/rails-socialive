class AddDefaultToLivestreams < ActiveRecord::Migration[5.0]
  def change
    change_column :livestreams, :tickets_sold, :integer, :default => 0
  end
end
