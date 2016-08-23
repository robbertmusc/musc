class RemoveTrainingAndDateAndTotalFromReservations < ActiveRecord::Migration[5.0]
  def change
    remove_reference :reservations, :training, foreign_key: true
    remove_column :reservations, :date, :datetime
    remove_column :reservations, :total, :integer
  end
end
