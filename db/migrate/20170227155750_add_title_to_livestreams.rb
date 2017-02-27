class AddTitleToLivestreams < ActiveRecord::Migration[5.0]
  def change
    add_column :livestreams, :title, :string
  end
end
