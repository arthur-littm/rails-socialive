class AddSessionIdToLivestreams < ActiveRecord::Migration[5.0]
  def change
    add_column :livestreams, :sessionId, :string
  end
end
