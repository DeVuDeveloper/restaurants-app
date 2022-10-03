class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.boolean :confirmed
      t.references :user, :index => true
      t.references :reservation, :index => true

      t.timestamps null: false
    end
  end
end
