class AddUsernameOptionaToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username_optional, :string
  end
end
