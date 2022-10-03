class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.string :title
      t.string :description
      t.references :restaurant, :index => true

      t.timestamps null: false
    end
  end
end
