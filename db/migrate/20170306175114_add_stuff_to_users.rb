class AddStuffToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :balance, :integer, :default => 0
  end
end
