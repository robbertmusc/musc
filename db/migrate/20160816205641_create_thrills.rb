class CreateThrills < ActiveRecord::Migration[5.0]
  def change
    create_table :thrills do |t|
      t.references :training, foreign_key: true, index: true
      t.date :thrilldate
      t.integer :thrillhr
      t.integer :thrillmin

      t.timestamps
    end
  end
end
