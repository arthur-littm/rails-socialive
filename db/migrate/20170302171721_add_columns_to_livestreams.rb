class AddColumnsToLivestreams < ActiveRecord::Migration[5.0]
  def change
    add_column :livestreams, :hour_of_stream, :datetime
    add_column :livestreams, :ticket_price, :float
  end
end
