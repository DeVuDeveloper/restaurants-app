class CreateSeats < ActiveRecord::Migration[6.1]
  def change
    create_table :seats do |t|
      t.integer :x
      t.integer :y
      t.boolean :reserved, :default => false
      t.references :seats_configuration, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
