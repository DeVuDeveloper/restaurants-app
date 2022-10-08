class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :title
      t.text :description
      t.string :image
      t.float :lat
      t.float :lng

      t.timestamps null: false
    end
  end
end

