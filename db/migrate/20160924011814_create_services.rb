class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.integer :vendor_id
      t.integer :category_id

      t.timestamps
    end
  end
end
