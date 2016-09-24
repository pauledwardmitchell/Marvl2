class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :content
      t.integer :rating
      t.boolean :flagged
      t.integer :vendor_id
      t.integer :user_id

      t.timestamps
    end
  end
end
