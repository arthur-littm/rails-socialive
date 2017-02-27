class AddReferenceToLivestreams < ActiveRecord::Migration[5.0]
  def change
    add_reference :livestreams, :user, foreign_key: true
  end
end
