class AddRubiesToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :rubies, :integer
  end
end
