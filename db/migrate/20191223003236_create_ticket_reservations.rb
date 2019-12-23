class CreateTicketReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :ticket_reservations do |t|
      t.integer :places, null: false
      t.references :ticket_type, null: false, foreign_key: true
      t.references :reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
