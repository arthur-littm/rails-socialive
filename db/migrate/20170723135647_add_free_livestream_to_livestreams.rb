class AddFreeLivestreamToLivestreams < ActiveRecord::Migration[5.0]
  def change
    add_column :livestreams, :free_livestream, :boolean
  end
end
