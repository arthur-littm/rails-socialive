class AddIdentificationToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :identification, :string
  end
end
