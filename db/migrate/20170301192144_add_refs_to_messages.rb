class AddRefsToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :livestream, foreign_key: true
  end
end
