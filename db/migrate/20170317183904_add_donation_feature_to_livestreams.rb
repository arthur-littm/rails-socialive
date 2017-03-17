class AddDonationFeatureToLivestreams < ActiveRecord::Migration[5.0]
  def change
    add_column :livestreams, :donation_feature, :boolean, default: true
  end
end
