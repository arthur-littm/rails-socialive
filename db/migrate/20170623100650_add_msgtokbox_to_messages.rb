class AddMsgtokboxToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :msgtokbox, :string
  end
end
