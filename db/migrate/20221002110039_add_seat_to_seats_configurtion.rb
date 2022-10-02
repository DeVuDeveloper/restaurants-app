class AddSeatToSeatsConfigurtion < ActiveRecord::Migration[6.1]
  def change
    add_reference :seats_configurations, :seat, index: true
  end
end
