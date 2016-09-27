class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
    	t.integer :user_id
    	t.string :name
    	t.string :media

      t.timestamps
    end
  end
end
