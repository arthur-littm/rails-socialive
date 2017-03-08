class AddDonationToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :donation, :boolean
  end
end
