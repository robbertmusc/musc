class AddThrillToReservations < ActiveRecord::Migration[5.0]
  def change
    add_reference :reservations, :thrill, foreign_key: true
  end
end
