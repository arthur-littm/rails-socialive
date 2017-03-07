class AddEarnedBalanceToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :earned_balance, :integer, :default => 0
  end
end
