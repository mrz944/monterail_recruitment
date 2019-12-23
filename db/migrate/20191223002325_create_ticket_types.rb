class CreateTicketTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :ticket_types do |t|
      t.integer :places, null: false
      t.integer :selling_options, array: true, null: false
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
