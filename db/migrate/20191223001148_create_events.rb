class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.datetime :date, precision: 6, null: false

      t.timestamps
    end
  end
end
