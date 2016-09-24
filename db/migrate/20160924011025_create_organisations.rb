class CreateOrganisations < ActiveRecord::Migration[5.0]
  def change
    create_table :organisations do |t|
      t.string :name
      t.datetime :membership_expiration

      t.timestamps
    end
  end
end
