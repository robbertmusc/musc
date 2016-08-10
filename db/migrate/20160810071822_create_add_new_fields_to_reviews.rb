class CreateAddNewFieldsToReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :add_new_fields_to_reviews do |t|
      t.references :user, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
