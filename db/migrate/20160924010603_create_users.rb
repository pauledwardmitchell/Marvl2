class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :organisation_id
      t.date :membership_expiration

      t.timestamps
    end
  end
end
