class AddFieldsToTraining < ActiveRecord::Migration[5.0]
  def change
    add_column :trainings, :latitude, :float
    add_column :trainings, :longitude, :float
  end
end
