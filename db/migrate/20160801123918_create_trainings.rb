class CreateTrainings < ActiveRecord::Migration[5.0]
  def change
    create_table :trainings do |t|
      t.string :tr_type
      t.string :tr_intensity
      t.text :tr_description
      t.string :tr_location
      t.string :tr_time
      t.integer :tr_max_attendants
      t.integer :tr_price
      t.integer :tr_duration
      t.string :tr_gender
      t.boolean :tr_active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
