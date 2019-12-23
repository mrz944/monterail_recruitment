class AddNameToTicketType < ActiveRecord::Migration[6.0]
  def change
    add_column :ticket_types, :name, :string, null: false
  end
end
