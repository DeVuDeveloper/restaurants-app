class CreateMeals < ActiveRecord::Migration[6.1]
  create_table :meals do |t|
    t.string :title
    t.string :description
    t.float :price
    t.references :menu, :index => true

    t.timestamps null: false
  end
end
