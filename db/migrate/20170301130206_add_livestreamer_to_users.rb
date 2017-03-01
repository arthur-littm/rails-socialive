class AddLivestreamerToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :livestreamer, :boolean, default: false
  end
end
