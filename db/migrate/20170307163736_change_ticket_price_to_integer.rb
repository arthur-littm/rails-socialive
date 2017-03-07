class ChangeTicketPriceToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :livestreams, :ticket_price, :integer
  end
end
