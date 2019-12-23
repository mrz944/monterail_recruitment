class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.integer :status, null: false

      t.timestamps
    end
  end
end
