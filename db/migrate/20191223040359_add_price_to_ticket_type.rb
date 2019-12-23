class AddPriceToTicketType < ActiveRecord::Migration[6.0]
  def change
    add_column :ticket_types, :price, :money 
  end
end
