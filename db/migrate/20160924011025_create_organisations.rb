class CreateOrganisations < ActiveRecord::Migration[5.0]
  def change
    create_table :organisations do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :phone
      t.datetime :membership_expiration

      t.timestamps
    end
  end
end
