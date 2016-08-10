class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :star, default: 1
      t.references :training, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end

# leo voegt nog toe bij integer en references , index: true
# bij timestamps nog null: false 
